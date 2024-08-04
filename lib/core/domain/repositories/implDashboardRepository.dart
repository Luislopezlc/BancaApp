import 'dart:async';

import 'package:flutter_application_1/core/domain/models/dashboardModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';
import 'package:flutter_application_1/core/domain/user.dart';

abstract class implDashboardRepository
{
Future<DashboardModel> loadDashboardModel();
Future<ResponseAPI> getAccountDTO();


}