import 'dart:async';

import 'package:flutter_application_1/core/domain/models/registerModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';

abstract class implRegisterRepository
{
Future<RegisterModel> loadRegisterModel();
Future<ResponseAPI> saveUser(RegisterModel request);
}