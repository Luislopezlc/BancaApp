import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/configuration_variables.dart';
import 'package:flutter_application_1/core/domain/models/registerModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implRegisterRepository.dart';

class RegisterRepository implements implRegisterRepository {
  @override
  Future<RegisterModel> loadRegisterModel() async {
    final Map<String, RegisterModel> response = jsonDecode(
        await rootBundle.loadString('assets/json_data/register.json'));
    return RegisterModel.fromJson(response);
  }

  @override
  FutureOr<RegisterModel?> saveUser(RegisterModel request) async {
    try {
      var dio = Dio();
      Response response = await dio.post(
        apiUrl,
        data: request,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = response.data;

        if (data['status'] == 'Success') {
          return RegisterModel.fromJson(data['data']);
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
