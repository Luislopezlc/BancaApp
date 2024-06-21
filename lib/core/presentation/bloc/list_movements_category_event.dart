
import 'package:flutter_application_1/core/domain/models/listMovementsCategory.dart';
import 'package:flutter_application_1/core/domain/models/movementsCategoryModel.dart';

abstract class ListMovementsCategoryEvent {}

class LoadListMovementsCategoryDataEvent extends ListMovementsCategoryEvent {}

class MovementChanged extends ListMovementsCategoryEvent {
  final ListMovementsCategoryModel movements;

  MovementChanged(this.movements);
}


class ListMovementsCategorySubmitted extends ListMovementsCategoryEvent{}
// Puedes definir más eventos según sea necesario para tu lógica
