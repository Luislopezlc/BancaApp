import 'package:flutter_application_1/core/data/models/respositories/movementsRepository.dart';
import 'package:flutter_application_1/core/domain/models/movementsModel.dart';

class LoadMovementsData {
  final movementsRepository repository;

  LoadMovementsData(this.repository);
  
  Future<MovementsModel> call () async {
    final movementsData = await repository.loadMovementsModel();

    if(movementsData.name.isEmpty)
    {
      throw Exception("the field name cant be empty");
    }
    
    if(movementsData.date.isEmpty)
    {
      throw Exception("the field date cant be empty");
    }

     return movementsData;
  }
}