import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/listMovementsCategory.dart';
import 'package:flutter_application_1/core/domain/models/movementsCategoryModel.dart';

class ListMovementsCategoryState extends Equatable {
  final ListMovementsCategoryModel movements;

   const ListMovementsCategoryState({
    List<MovementsCategoryModel>? movements,
  }) : movements = movements ?? [];
  factory ListMovementsCategoryState.fromModel(ListMovementsCategoryModel model) {
    return ListMovementsCategoryState(
      movements: model.movements ?? [], // Inicializa con una lista vacía si model.movements es null
    );
  }

  ListMovementsCategoryState copyWith({
    ListMovementsCategoryModel? movements,
  }) {
    return ListMovementsCategoryState(
      movements: movements ?? this.movements,
    );
  }

  @override
  List<Object?> get props => [movements];
}