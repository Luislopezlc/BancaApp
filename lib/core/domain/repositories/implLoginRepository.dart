import 'package:flutter_application_1/core/domain/models/loginModel.dart';

abstract class implLoginRepository
{
Future<LoginModel> loadLoginModel();
}