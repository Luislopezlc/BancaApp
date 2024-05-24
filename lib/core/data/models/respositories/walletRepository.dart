
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/models/walletModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implWalletRepository.dart';

class walletRepository implements implWalletRepository
{
  @override
  Future<WalletModel> loadWalletModel() async {
    final Map<String, dynamic> response =jsonDecode(await rootBundle.loadString('assets/json_data/wallet.json'));
    return  WalletModel.fromJson(response);
  }
 
  
}

