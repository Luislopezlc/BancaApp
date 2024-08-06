import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/movementsModel.dart';

class HistoryMovementsState extends Equatable {
  const HistoryMovementsState();
  @override
  List<Object> get props => [];
}

class HistoryMovementsLoading extends HistoryMovementsState {}

class HistoryMovementsLoaded extends HistoryMovementsState {
  final List<MovementsModel> movements;
  const HistoryMovementsLoaded(this.movements);
  @override
  List<Object> get props => [movements];
}

class HistoryMovementsInitial extends HistoryMovementsState {}

class HistoryMovementsError extends HistoryMovementsState {
  final String message;
  const HistoryMovementsError(this.message);
  @override
  List<Object> get props => [message];
}
