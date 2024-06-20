import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/models/listMovementsCategory.dart';
import 'package:flutter_application_1/core/domain/repositories/implListMovementsCategoryRepository.dart';

class ListMovementsCategoryRepository implements implListMovementsCategoryRepository
{
  @override
  Future<ListMovementsCategoryModel> loadListMovementsCategoryModel() async {
    // TODO: implement loadLoginModel
    final Map<String, dynamic> response = jsonDecode(await rootBundle.loadString('assets/json_data/listMovementsCategory.json'));
    return  ListMovementsCategoryModel.fromJson(response);
  }
}