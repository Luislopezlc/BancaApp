
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/models/listTransfersModel.dart';
import 'package:flutter_application_1/core/domain/models/transfersModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implTransfersRepository.dart';

class transfersRepository implements implTransfersRepository
{
  @override
  Future<TransferModel> loadTransferModel() async {
   final Map<String, dynamic> response =jsonDecode(await rootBundle.loadString('assets/json_data/transfers.json'));
    return  TransferModel.fromJson(response);
  }
  
  @override
  Future<ListTransfersModel> loadListTransferModel() async {
      final Map<String, dynamic> response = jsonDecode(await rootBundle.loadString('assets/json_data/transfers.json'));
     return ListTransfersModel.fromJson(response);
  }
  
  List<TransferModel> transferModelListFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => TransferModel.fromJson(json as Map<String, dynamic>)).toList();
}

List<Map<String, dynamic>> transferModelListToJson(List<TransferModel> modelList) {
  return modelList.map((model) => model.toJson()).toList();
}
}

