import 'dart:async';

import 'package:flutter_application_1/core/data/models/respositories/registerRepository.dart';
import 'package:flutter_application_1/core/domain/models/registerModel.dart';
import 'package:flutter_application_1/core/domain/models/ResponseModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';

class LoadRegisterData {
  final RegisterRepository repository;

  LoadRegisterData(this.repository);

  // Future<RegisterModel> call() async {
  //   final loginData = await repository.loadRegisterModel();

  //   _validateEmail(loginData.email);
  //   _validatePassword(loginData.password);
  //   _validateRFC(loginData.rfc);

  //   return loginData;
  // }

  Future<ResponseAPI> call(RegisterModel request) async {
    var response = await repository.saveUser(request);
    return response;
  }

 
}
