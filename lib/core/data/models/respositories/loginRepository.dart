import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart'; // Para rootBundle
import 'package:flutter_application_1/core/domain/configuration_variables.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/loginDTO.dart';
import 'package:flutter_application_1/core/domain/models/loginModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';
import 'package:flutter_application_1/core/domain/repositories/ImplLoginRepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class LoginRepository implements implLoginRepository {
   var dio = Dio();
    var logger = Logger();
   final storage = FlutterSecureStorage();
  @override
  Future<LoginModel> loadLoginModel() async {
    final Map<String, dynamic> response = jsonDecode(await rootBundle.loadString("assets/json_data/login.json"));
    return LoginModel.fromJson(response);
  }

   Future<ResponseAPI> login(LoginDTO credentials) async {
    ResponseAPI result = ResponseAPI(status: '400', data: {});
   try{
      Response response = await dio.post(
        '$apiUrl/auth/login',
        data: credentials.toJson(),
      );
      logger.i(response);
      if (response.statusCode == 200) 
      {
        var data = response.data;
        var token = data['access_token'];
        await storage.write(key: 'jwt_token', value: token);
        result.status = "200";
      }else{
        var data = response.data;
        result.data = data['message'];
        result.status = "400";
      }
   }catch(e)
   {
    if (e is DioError) {
      if (e.type == DioErrorType.response) {
        Response? errorResponse = e.response;
        if (errorResponse != null) {
            if(errorResponse.statusCode == 401 || errorResponse.statusCode == 400)
            { 
              result.status = "400";
              result.data = errorResponse.data['message'];
              return result;
            }
          }
        } 
      }

      result.status = '500';
      result.data = 'Ha ocurrido un error en el servidor.';
     logger.i(e);
   }
    return result;

   }
}
