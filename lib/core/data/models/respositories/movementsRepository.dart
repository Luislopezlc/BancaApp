import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/models/movementsModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implMovementsRepository.dart';

class movementsRepository implements implMovementsRepository
{
  @override
  Future<MovementsModel> loadMovementsModel() async {
    final Map<String, dynamic> response =jsonDecode(await rootBundle.loadString('assets/json_data/movements.json'));
    return  MovementsModel.fromJson(response);
  }
 
  
}