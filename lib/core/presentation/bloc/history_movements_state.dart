import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/historyMovementsModel.dart';
import 'package:flutter_application_1/core/domain/models/movementsModel.dart';

class HistoryMovementsState extends Equatable {
  final List<MovementsModel> movements;
  final bool isLoading;
  final String error;

  const HistoryMovementsState({
    this.movements = const [],
    this.isLoading = false,
    this.error = '',
  });

factory HistoryMovementsState.fromModel(HistoryMovementsModel model) {
    return HistoryMovementsState(
      
      movements: model.movements, // Descomenta esto si MovementsModel está definido y quieres incluirlo
      isLoading: true,
    );
  }

  HistoryMovementsState copyWith({
    List<MovementsModel>? movements,
    bool? isLoading,
    String? error,
  }) {
    return HistoryMovementsState(
      movements: movements ?? this.movements,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [movements, isLoading, error];
}
