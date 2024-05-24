
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/models/transfersModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implTransfersRepository.dart';

class transfersRepository implements implTransfersRepository
{
  @override
  Future<TransferModel> loadTransferModel() async {
   final Map<String, dynamic> response =jsonDecode(await rootBundle.loadString('assets/json_data/transfer.json'));
    return  TransferModel.fromJson(response);
  }
  
}

