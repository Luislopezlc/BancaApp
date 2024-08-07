import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/listMovementsCategory.dart';
import 'package:flutter_application_1/core/domain/models/movementsCategoryModel.dart';

class ListMovementsCategoryState extends Equatable {

 const ListMovementsCategoryState();

  @override
  List<Object?> get props => [];
}

class ListMovementsCategoryInitial extends ListMovementsCategoryState{}
class ListMovementsCategoryLoading extends ListMovementsCategoryState{}
class ListMovementsCategoryLoaded extends ListMovementsCategoryState{
  final List<MovementsCategoryModel> movements; 
  const ListMovementsCategoryLoaded(this.movements);
     @override
  List<Object?> get props => [movements];
}
class ListMovementsCategoryError extends ListMovementsCategoryState{
  final String message;
  const ListMovementsCategoryError(this.message);
    @override
  List<Object?> get props => [message];
}