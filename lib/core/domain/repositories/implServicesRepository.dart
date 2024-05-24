import 'package:flutter_application_1/core/domain/models/ServicesModel.dart';

abstract class implServicesRepository
{
Future<ServicesModel> loadServicesModel();
}