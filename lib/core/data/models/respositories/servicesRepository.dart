import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/configuration_variables.dart';
import 'package:flutter_application_1/core/domain/models/ServicesModel.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/ServiceDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/paidServiceDTO.dart';
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

    try {
      Response response = await dio.get(
        '$apiUrl/services',
      );

      if (response.statusCode == 200) {
        var data = response.data;
        services = ServiceDTO.fromJsonList(data['data']);
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
            result.data = services.where((element) => element.idUsers == idUser).toList();
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
}
