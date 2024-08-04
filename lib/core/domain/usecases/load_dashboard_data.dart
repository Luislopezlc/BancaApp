import 'dart:ffi';

import 'package:flutter_application_1/core/data/models/respositories/dashboardRepository.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/accountDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/userDTO.dart';
import 'package:flutter_application_1/core/domain/models/dashboardModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';

class LoadDashboardData {
  final dashboardRepository repository;

  LoadDashboardData(this.repository);

  Future<DashboardModel> call() async {
    final dashboardData = await repository.loadDashboardModel();

    if (dashboardData.name.isEmpty) {
      throw Exception("the field name cant be empty");
    }
    return dashboardData;
  }

  Future<ResponseAPI> getDashboard() async {
    ResponseAPI result = ResponseAPI(status: '400', data: {});

    final DashboardModel dashboardData = DashboardModel(
        name: '', totalAmount: 0, income: '', bills: '', movements: []);

    AccountDTO accountDTO = AccountDTO(id: 0, idUser: 0, balance: 0, status: 0, card: [], 
    user: UserDTO(name: '', lastname: '',email: '',rfc: '',phone: '',password: '',id_bank: 0));
    var responseAccount = await repository.getAccountDTO();

    if (responseAccount.status != "200") {
      return responseAccount;
    }

    if (responseAccount.data is AccountDTO) {
      accountDTO = responseAccount.data as AccountDTO;
    }

    dashboardData.totalAmount = (accountDTO.balance).toDouble();
    dashboardData.name = accountDTO.user.name;
   result.data = dashboardData;
    return result;
  }
}
