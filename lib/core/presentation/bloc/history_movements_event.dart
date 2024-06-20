import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/movementsModel.dart';

abstract class HistoryMovementsEvent extends Equatable
{
  const HistoryMovementsEvent();
    @override
  List<Object?> get props => [];

}


class LoadHistoryMovementsDataEvent extends HistoryMovementsEvent {}


class MovementsChanged extends HistoryMovementsEvent
{
  final List<MovementsModel> movements; 
  const MovementsChanged(this.movements);
  @override
  List<Object?> get props => [movements];
}


class HistoryMovementsSubmitted extends HistoryMovementsEvent{}



