import 'package:flutter_application_1/core/data/models/respositories/dashboardRepository.dart';
import 'package:flutter_application_1/core/domain/models/dashboardModel.dart';

class LoadDashboardData {
  final dashboardRepository repository;

  LoadDashboardData(this.repository);
  
  Future<DashboardModel> call () async {
    final dashboardData = await this.repository.loadDashboardModel();

    if(dashboardData.name.isEmpty)
    {
      throw Exception("the field name cant be empty");
    }
     return dashboardData;
  }
}