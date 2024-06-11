import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/models/ServicesModel.dart';
import 'package:flutter_application_1/core/domain/models/registerModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implRegisterRepository.dart';

class RegisterRepository implements implRegisterRepository
{
  @override
  Future<RegisterModel> loadRegisterModel() async {
    final Map<String, dynamic> response =jsonDecode(await rootBundle.loadString('assets/json_data/register.json'));
    return  RegisterModel(name: "dasd", lastname: "asd", email: "asdasd", rfc: "", phone: "", password: "", idBank: 1);
  }
  
}
