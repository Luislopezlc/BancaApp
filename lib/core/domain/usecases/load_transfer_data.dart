import 'package:flutter_application_1/core/data/models/respositories/transfersRepository.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/transferDTO.dart';
import 'package:flutter_application_1/core/domain/models/listTransfersModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';
import 'package:flutter_application_1/core/domain/models/transfersModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoadtransferData {
  final transfersRepository repository;
  final storage = FlutterSecureStorage();
  LoadtransferData(this.repository);
  
  Future<TransferModel> call () async {
    final transferData = await repository.loadTransferModel();

    if(transferData.name.isEmpty)
    {
      throw Exception("the field name cant be empty");
    }

     return transferData;
  }

   Future<ListTransfersModel> callList () async {
    final transferData = await repository.loadListTransferModel();
    return transferData;
  }

  Future<ResponseAPI>getIncome() async
  {
    ResponseAPI result = ResponseAPI(status: '400', data: {});

     List<TransferDTO> transfers = [];

    var responseTransfers = await repository.getTransfers();
    if(responseTransfers.status != '200')
    {
      return responseTransfers;
    }

    if(responseTransfers.data is List<TransferDTO>)
    {
      transfers = responseTransfers.data as List<TransferDTO>;
    }

     String? cardNumber = await storage.read(key: 'CardNumber');

    double income = 0;

    var transferIncomes = transfers.where((element) => element.receptorAccount == cardNumber);

    for(var transfer in transferIncomes)
    {
        income += transfer.amount;
    }

    result.data = income.toString();
    result.status = '200';

    return result;
  }

}