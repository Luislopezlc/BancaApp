import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/models/historyMovementsModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implHistoryMovementsRepository.dart';

class historyMovementsRepository implements implHistoryMovements
{
 
  @override
  Future<HistoryMovementsModel> loadHistoryMovements() async {
     final Map<String, dynamic> response =jsonDecode(await rootBundle.loadString('assets/json_data/movements.json'));
    return HistoryMovementsModel.fromJson(response);
  }
}