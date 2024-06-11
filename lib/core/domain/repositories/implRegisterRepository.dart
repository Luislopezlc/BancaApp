import 'package:flutter_application_1/core/domain/models/registerModel.dart';

abstract class implRegisterRepository
{
Future<RegisterModel> loadRegisterModel();
}