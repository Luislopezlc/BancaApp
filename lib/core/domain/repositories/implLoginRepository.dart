import 'package:flutter_application_1/core/domain/models/apiModels/loginDTO.dart';
import 'package:flutter_application_1/core/domain/models/loginModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';

abstract class implLoginRepository
{
Future<LoginModel> loadLoginModel();
Future<ResponseAPI> login(LoginDTO credentials);
}