import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/configuration_variables.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/accountDTO.dart';
import 'package:flutter_application_1/core/domain/models/dashboardModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';
import 'package:flutter_application_1/core/domain/repositories/implDashboardRepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class dashboardRepository implements implDashboardRepository
{
  var dio = Dio();
  final storage = const FlutterSecureStorage();
Logger logger = Logger();
  @override
  Future<DashboardModel> loadDashboardModel() async {
    final Map<String, dynamic> response =jsonDecode(await rootBundle.loadString('assets/json_data/dashboard.json'));
    return  DashboardModel.fromJson(response);
  }

  @override
  Future<ResponseAPI> getAccountDTO() async {
    ResponseAPI result = ResponseAPI(status: '400', data: {});
     AccountDTO accountDTO;
    String? token = await storage.read(key: 'jwt_token');
    if(token == null || token.isEmpty )
    {
      result.status = '400';
      result.data = 'No se puedo obtener el token';
      return result;
    }
 
    await configurationDio(token);
   try{
      Response response = await dio.get(
        '$apiUrl/accounts/me',
      );

      if (response.statusCode == 200) 
      {
        var data = response.data;
       
        if (data['status'] == 'Sucess') {
         accountDTO =  AccountDTO.fromJson(data['data']);
         result.data = accountDTO;
         result.status = '200';
        }
      }
   }catch(e)
   {
    result.status = '400';
    result.message = 'No se pudo obtener la información, intentar más tarde';
   }

    return result;
  }

 
configurationDio(String token) async
 {
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
  
}


