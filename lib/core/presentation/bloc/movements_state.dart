import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/movementsModel.dart';

class MovementsState extends Equatable {
  const MovementsState();
  @override
  List<Object?> get props => [ ];
}


class MovementsInitial extends MovementsState{}
class MovementsLoading extends MovementsState{}
class MovementsLoaded extends MovementsState{
  final String totalBills;
  const MovementsLoaded(this.totalBills);
 @override
  List<Object?> get props => [totalBills];
}
class MovementsError extends MovementsState{
  final String message;
  const MovementsError(this.message);
 @override
  List<Object?> get props => [message];
}