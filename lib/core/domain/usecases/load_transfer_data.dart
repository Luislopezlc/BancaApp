import 'package:flutter_application_1/core/data/models/respositories/transfersRepository.dart';
import 'package:flutter_application_1/core/domain/models/listTransfersModel.dart';
import 'package:flutter_application_1/core/domain/models/transfersModel.dart';

class LoadtransferData {
  final transfersRepository repository;

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
}