

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/models/withdrawalModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implWithdrawalRepository.dart';

class withdrawalRepository implements implwithdrawalModelRepository
{
  @override
  Future<withdrawalModel> loadWithdrawalModel() async {
 final Map<String, dynamic> response =jsonDecode(await rootBundle.loadString('assets/json_data/withdrawal.json'));
    return  withdrawalModel.fromJson(response);
  }
 
  
}

