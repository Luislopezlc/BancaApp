import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/configuration_variables.dart';
import 'package:flutter_application_1/core/domain/models/ServicesModel.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/ServiceDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/paidServiceDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/postServiceDTO.dart';
import 'package:flutter_application_1/core/domain/models/listServicesModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';
import 'package:flutter_application_1/core/domain/repositories/implServicesRepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class servicesRepository implements implServicesRepository {
  var dio = Dio();
  final storage = const FlutterSecureStorage();
  Logger logger = Logger();
  @override
  Future<ServicesModel> loadServicesModel() async {
    final Map<String, dynamic> response = jsonDecode(
        await rootBundle.loadString('assets/json_data/services.json'));
    return ServicesModel.fromJson(response);
  }

  @override
  Future<ListServicesModel> loadListServicesModel() async {
    final Map<String, dynamic> response = jsonDecode(
        await rootBundle.loadString('assets/json_data/servicesPayment.json'));
    return ListServicesModel.fromJson(response);
  }

  @override
  Future<ResponseAPI> getServices() async {
    ResponseAPI result = ResponseAPI(status: '400', data: {});
    List<ServiceDTO> services = [];

    String? token = await storage.read(key: 'jwt_token');

    if (token == null || token.isEmpty) {
      result.status = '400';
      result.data = 'No se puedo obtener el token';
      return result;
    }
  configurationDio(token);
    try {
      Response response = await dio.get(
        '$apiUrl/services',
      );

      if (response.statusCode == 200) {
        var data = response.data;
        services = ServiceDTO.fromJsonList(data);
        result.data = services;
        result.status = '200';
      }
    } catch (e) {
      result.status = '400';
      result.message = 'No se pudo obtener la información, intentar más tarde';
    }

    return result;
  }

  @override
  Future<ResponseAPI> getPaidServices() async {
    ResponseAPI result = ResponseAPI(status: '400', data: {});
    List<PaidServiceDTO> services = [];

    String? token = await storage.read(key: 'jwt_token');

    if (token == null || token.isEmpty) {
      result.status = '400';
      result.data = 'No se puedo obtener el token';
      return result;
    }

     String? IdUser = await storage.read(key: 'IdUser');
     bool filterByUser = false;
     int idUser = 0;
    if (IdUser != null && IdUser.isNotEmpty) {
      filterByUser = true;
      idUser = int.parse(IdUser);
    }

    configurationDio(token);
    try {
      Response response = await dio.get(
        '$apiUrl/log-services',
      );

      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status'] == "Success") {
          services = PaidServiceDTO.fromJsonList(data['data']);

          if(filterByUser)
          {
            result.data = services.where((x) => x.idUsers == idUser).toList();
          }else
          {
            result.data = services;
          }
          result.status = '200';
        }
      }
    } catch (e) {
      result.status = '400';
      result.message = 'No se pudo obtener la información, intentar más tarde';
    }

    return result;
  }
@override
  Future<ResponseAPI> getBillsInPaidService() async
  {
     ResponseAPI result = ResponseAPI(status: '400', data: {});

       List<PaidServiceDTO> services = [];

    var responsePaidServices = await getPaidServices();
    if(responsePaidServices.status != '200')
    {
      return responsePaidServices;
    }

    if(responsePaidServices.data is List<PaidServiceDTO>)
    {
      services = responsePaidServices.data as List<PaidServiceDTO>;
    }

    String? idUser = await storage.read(key: 'IdUser');

    if (idUser == null || idUser.isEmpty) {
      result.status = '400';
      result.message = 'No se puedo obtener el usuarios';
      return result;
    }

    int id = int.parse(idUser);
    double bills = 0;

    var servicesBills = services.where((element) => element.idUsers == id);

    for(var service in servicesBills)
    {
        bills += double.parse(service.amount);
    }

    result.data = bills;
    result.status = '200';

    return result;
  }

  configurationDio(String token) async {
    // Configurar interceptor para añadir el token JWT
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Obtener el token JWT
        // Agregar el token a las cabeceras de la solicitud
        options.headers['Authorization'] = 'Bearer $token';
        // Continuar con la solicitud
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Procesar la respuesta
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        // Manejar errores
        return handler.next(e);
      },
    ));
  }
  
  @override
  Future<ResponseAPI> postService(PostServiceDTO service) async {
     ResponseAPI result = ResponseAPI(status: '400', data: {});
    String? token = await storage.read(key: 'jwt_token');

    if (token == null || token.isEmpty) {
      result.status = '400';
      result.data = 'No se puedo obtener el token';
      return result;
    }
  configurationDio(token);
    try {
      Response response = await dio.post(
        '$apiUrl/log-services',
        data: service.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = response.data;
        if(data['status'] == 'Success')
        {
          result.status = '200';
          result.message = 'Se ha realizado el pago con éxito';
        }
        else
        {
          result.message = 'No se ha podido realizar el pago.';
        }
        
      }
    } catch (e) {
      result.status = '400';
      result.message = 'No se pudo obtener la información, intentar más tarde';
    }

    return result;

  }
}
