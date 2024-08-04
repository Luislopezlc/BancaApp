import 'dart:ffi';

import 'package:flutter_application_1/core/data/models/respositories/dashboardRepository.dart';
import 'package:flutter_application_1/core/data/models/respositories/movementsRepository.dart';
import 'package:flutter_application_1/core/data/models/respositories/servicesRepository.dart';
import 'package:flutter_application_1/core/data/models/respositories/transfersRepository.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/accountDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/cardDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/userDTO.dart';
import 'package:flutter_application_1/core/domain/models/dashboardModel.dart';
import 'package:flutter_application_1/core/domain/models/movementsModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';
import 'package:flutter_application_1/core/domain/usecases/load_movements_data.dart';
import 'package:flutter_application_1/core/domain/usecases/load_transfer_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoadDashboardData {
  final dashboardRepository repository;
  final transfersRepository transferRepository;
  final LoadMovementsData movementsData;
  final LoadtransferData dataTransfer;
  final servicesRepository paidServicesRepository;
  final storage = const FlutterSecureStorage();
  LoadDashboardData(
      this.repository, this.transferRepository, this.movementsData,this.dataTransfer,this.paidServicesRepository);

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

    AccountDTO accountDTO = AccountDTO(
        id: 0,
        idUser: 0,
        balance: 0,
        status: 0,
        card: [],
        user: UserDTO(
            name: '',
            lastname: '',
            email: '',
            rfc: '',
            phone: '',
            password: '',
            id_bank: 0));

    List<MovementsModel> movements = [];

    var responseAccount = await repository.getAccountDTO();

    if (responseAccount.status != "200") {
      return responseAccount;
    }

    if (responseAccount.data is AccountDTO) {
      accountDTO = responseAccount.data as AccountDTO;
    }

    dashboardData.totalAmount = (accountDTO.balance).toDouble();
    dashboardData.name = accountDTO.user.name;

    String? idUser = await storage.read(key: 'IdUser');
    if (idUser == null || idUser.isEmpty) {
      await storage.write(key: 'IdUser', value: accountDTO.idUser.toString());
    }

    CardDTO? card = accountDTO.card.firstOrNull;
    if (card == null) {
      result.message = "No se pudo obtener la tarjeta";
      result.status = "400";
    } else {
      String? cardNumber = await storage.read(key: 'CardNumber');

      if (cardNumber == null || cardNumber.isEmpty) {
        await storage.write(key: 'CardNumber', value: card.cardNumber);
      }

      String? cardAccount = await storage.read(key: 'CardAccount');
      if (cardAccount == null || cardAccount.isEmpty) {
        await storage.write(key: 'CardAccount', value: card.cardAccount);
      }
    }

    var responseMovements = await movementsData.getMovements();

    if (responseMovements.status != "200") {
      return responseMovements;
    }

    if (responseMovements.data is List<MovementsModel>) {
      movements = responseMovements.data as List<MovementsModel>;
    }

    dashboardData.movements = movements;

    var incomeResponse = await dataTransfer.getIncome();
    if(incomeResponse.status != '200')
    {
        return incomeResponse;
    }
    
    dashboardData.income = incomeResponse.data as String;


    var responseBillsInTransfers = await dataTransfer.getBillsInTranfers();
     if(responseBillsInTransfers.status != '200')
    {
        return responseBillsInTransfers;
    }

    double bills = responseBillsInTransfers.data as double;

    var responseBillsInPaidServices = await paidServicesRepository.getBillsInPaidService();
     if(responseBillsInPaidServices.status != '200')
    {
        return responseBillsInPaidServices;
    }

    bills += responseBillsInPaidServices.data as double;

    dashboardData.bills = bills.toString();
    
    result.data = dashboardData;
    result.status = '200';
    return result;
  }
}
