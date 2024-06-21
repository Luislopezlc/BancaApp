import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/models/listMovementsCategory.dart';
import 'package:flutter_application_1/core/domain/models/listWalletModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implListWalletRepository.dart';

class ListWalletRepository implements implListWalletRepository
{
  @override
  Future<ListWalletModel> loadListWalletModel() async {
   final Map<String, dynamic> response = jsonDecode(await rootBundle.loadString('assets/json_data/wallet.json'));
    return  ListWalletModel.fromJson(response);
  }
}