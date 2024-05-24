import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/models/ServicesModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implServicesRepository.dart';

class servicesRepository implements implServicesRepository
{
  @override
  Future<ServicesModel> loadServicesModel() async {
    final Map<String, dynamic> response =jsonDecode(await rootBundle.loadString('assets/json_data/services.json'));
    return  ServicesModel.fromJson(response);
  }
}