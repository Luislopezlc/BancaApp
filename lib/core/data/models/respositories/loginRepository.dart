import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/models/loginModel.dart';
import 'package:flutter_application_1/core/domain/repositories/ImplLoginRepository.dart';

class loginRepository implements implLoginRepository
{
  @override
  Future<LoginModel> loadLoginModel() async {
    // TODO: implement loadLoginModel
    final Map<String, dynamic> response =jsonDecode(await rootBundle.loadString('assets/json_data/login.json'));
    return  LoginModel.fromJson(response);
  }
  
}