import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/models/dashboardModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implDashboardRepository.dart';

class dashboardRepository implements implDashboardRepository
{
  @override
  Future<DashboardModel> loadDashboardModel() async {
    // TODO: implement loadLoginModel
    final Map<String, dynamic> response =jsonDecode(await rootBundle.loadString('assets/json_data/dashboard.json'));
    return  DashboardModel.fromJson(response);
  }
}