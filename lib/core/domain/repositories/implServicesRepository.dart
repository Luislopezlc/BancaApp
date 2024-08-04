import 'package:flutter_application_1/core/domain/models/ServicesModel.dart';
import 'package:flutter_application_1/core/domain/models/listServicesModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';

abstract class implServicesRepository
{
Future<ServicesModel> loadServicesModel();
Future<ListServicesModel> loadListServicesModel();
Future<ResponseAPI> getServices();
Future<ResponseAPI> getPaidServices();

}