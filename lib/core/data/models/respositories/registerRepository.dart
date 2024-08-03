import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/configuration_variables.dart';
import 'package:flutter_application_1/core/domain/models/registerModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';
import 'package:flutter_application_1/core/domain/repositories/implRegisterRepository.dart';

class RegisterRepository implements implRegisterRepository {
   var dio = Dio();
  @override
  Future<RegisterModel> loadRegisterModel() async {
    final Map<String, RegisterModel> response = jsonDecode(
        await rootBundle.loadString('assets/json_data/register.json'));
    return RegisterModel.fromJson(response);
  }

  @override
  Future<ResponseAPI> saveUser(RegisterModel request) async {
   ResponseAPI result = ResponseAPI(status: '400', data: {});
   try{
      Response response = await dio.post(
        '$apiUrl/users',
        data: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) 
      {
        var data = response.data;
       
        if (data['status'] == 'Success') {
         result.status = '200';
         result.data  = 'Usuario guardado correctamente, inicie sesión.';
        }else{
            result.status = '400';
            result.data = data['message'];
        }
      }
   }catch(e)
   {
      result.status = '500';
      result.data = 'Ha ocurrido un error en el servidor.';
   }
    return result;
  }
}
