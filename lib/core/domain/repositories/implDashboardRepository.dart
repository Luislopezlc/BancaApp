import 'package:flutter_application_1/core/domain/models/dashboardModel.dart';

abstract class implDashboardRepository
{
Future<DashboardModel> loadDashboardModel();
}