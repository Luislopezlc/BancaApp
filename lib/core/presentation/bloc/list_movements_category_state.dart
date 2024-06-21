import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/listMovementsCategory.dart';

class ListMovementsCategoryState extends Equatable {
  final ListMovementsCategoryModel movements;

  ListMovementsCategoryState({
    ListMovementsCategoryModel? movements,
  }) : movements = movements ?? ListMovementsCategoryModel(movements: []);

  factory ListMovementsCategoryState.fromModel(ListMovementsCategoryModel model) {
    return ListMovementsCategoryState(
      movements: model,
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