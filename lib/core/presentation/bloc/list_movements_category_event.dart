import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/listMovementsCategory.dart';
import 'package:flutter_application_1/core/domain/models/movementsCategoryModel.dart';

abstract class ListMovementsCategoryEvent extends Equatable {
  const ListMovementsCategoryEvent();
   @override
  List<Object> get props => [];
}

class LoadMovementsCategoryDataEvent extends ListMovementsCategoryEvent {}
