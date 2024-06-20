import 'package:flutter_application_1/core/data/models/respositories/listMovementsCategoryRepository.dart';
import 'package:flutter_application_1/core/domain/models/listMovementsCategory.dart';

class LoadListMovementsCategoryData{
  final ListMovementsCategoryRepository repository;
  LoadListMovementsCategoryData(this.repository);

  Future<ListMovementsCategoryModel> call() async {
    // Implementa la lógica para cargar los movimientos históricos
    final data = await this.repository.loadListMovementsCategoryModel();
    return data;
  }
}
