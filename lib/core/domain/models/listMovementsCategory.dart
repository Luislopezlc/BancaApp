import 'package:flutter_application_1/core/domain/models/movementsCategoryModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listMovementsCategory.g.dart';

@JsonSerializable()
class ListMovementsCategoryModel {
    
List<MovementsCategoryModel> movements;

ListMovementsCategoryModel(
  {
    required this.movements
  }
);

factory ListMovementsCategoryModel.fromJson(Map<String, dynamic> json) => _$ListMovementsCategoryModelFromJson(json);
Map<String, dynamic> toJson() => _$ListMovementsCategoryModelToJson(this);
}
