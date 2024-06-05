import 'package:flutter_application_1/core/data/models/respositories/withdrawalRepository.dart';
import 'package:flutter_application_1/core/domain/models/withdrawalModel.dart';

class LoadwithdrawalData {
  final withdrawalRepository  repository;

  LoadwithdrawalData(this.repository);
  
  Future<withdrawalModel> call () async {
    final withdrawalData = await repository.loadWithdrawalModel();

    if(withdrawalData.maxAmountToRetire < 0)
    {
      throw Exception("the field maxAmountToRetire cant be 0");
    }
    
    if(withdrawalData.amountToRetire < 0)
    {
      throw Exception("the field amountToRetire cant be 0");
    }

    if(withdrawalData.codeForRetire.isEmpty)
    {
      throw Exception("the field codeForRetire cant be empty");
    }
     return withdrawalData;
  }
}