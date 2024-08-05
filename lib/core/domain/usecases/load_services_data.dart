import 'package:flutter_application_1/core/data/models/respositories/servicesRepository.dart';
import 'package:flutter_application_1/core/domain/models/ServicesModel.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/ServiceDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/paidServiceDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/postServiceDTO.dart';
import 'package:flutter_application_1/core/domain/models/listServicesModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';
import 'package:flutter_application_1/core/domain/models/servicePaymentModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class LoadServicesData {
  final servicesRepository repository;
  final storage = const FlutterSecureStorage();
  Logger logger = Logger();
  LoadServicesData(this.repository);

  Future<ServicesModel> call() async {
    final servicesData = await repository.loadServicesModel();

    if (servicesData.name.isEmpty) {
      throw Exception("the field name cant be empty");
    }

    if (servicesData.clientName.isEmpty) {
      throw Exception("the field clientName cant be empty");
    }

    if (servicesData.amountOfPayment.isEmpty) {
      throw Exception("the field amountOfPayment cant be empty");
    }

    if (servicesData.numberOfReference.isEmpty) {
      throw Exception("the field numberOfReference cant be empty");
    }

    return servicesData;
  }

  Future<ListServicesModel> callList() async {
    final servicesData = await repository.loadListServicesModel();
    return servicesData;
  }

  Future<ResponseAPI> getServices() async {
    ResponseAPI result = ResponseAPI(status: '400', data: {});
    List<ServicePaymentModel> services = [];
    List<ServiceDTO> servicesApi = [];
    try {
      var responseServices = await repository.getServices();
      if (responseServices.status != '200') {
        return responseServices;
      }

      if (responseServices.data is List<ServiceDTO>) {
        servicesApi = responseServices.data as List<ServiceDTO>;
      }

      for (var serviceApi in servicesApi) {
        ServicePaymentModel serviceModel =
            ServicePaymentModel(name: '', imagenUrl: '', id: 0);

        serviceModel.imagenUrl = serviceApi.icono;
        serviceModel.name = serviceApi.name;
        serviceModel.id = serviceApi.id;
        services.add(serviceModel);
      }

      result.data = services;
      result.status = '200';
    } catch (e) {
      result.message = 'No se pudo obtener la información';
    }

    return result;
  }

  Future<ResponseAPI> postService(PostServiceDTO service) async
  {
      ResponseAPI result = ResponseAPI(status: '400', data: {});

       String? idAccount = await storage.read(key: 'IdAccount');
      
      if(idAccount == null || idAccount.isEmpty)
      {
          result.message = 'No se puedo obtener el IdAccount';
          return result;
      }

       String? idUser = await storage.read(key: 'IdUser');

      if(idUser == null || idUser.isEmpty)
      {
          result.message = 'No se puedo obtener el IsUser';
          return result;
      }
      service.idAccount = int.parse(idAccount);
      service.idUsers = int.parse(idUser);

      var responseService = await repository.postService(service);
      
      return responseService;
  }


}
