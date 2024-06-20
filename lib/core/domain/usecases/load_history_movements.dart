import 'package:flutter_application_1/core/data/models/respositories/historyMovementsRepository.dart';
import 'package:flutter_application_1/core/domain/models/historyMovementsModel.dart';
import 'package:flutter_application_1/core/domain/models/movementsModel.dart';

class LoadHistoryMovementsData{
  final historyMovementsRepository repository;
  LoadHistoryMovementsData(this.repository);

  Future<HistoryMovementsModel> call() async {
    // Implementa la lógica para cargar los movimientos históricos
    final data = await this.repository.loadHistoryMovements();
    return data;
  }
}
