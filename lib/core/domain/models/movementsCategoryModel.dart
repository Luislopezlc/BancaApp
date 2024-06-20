
import 'package:flutter_application_1/core/domain/models/movementsModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movementsCategoryModel.g.dart';

@JsonSerializable()
class MovementsCategoryModel {
    
String title;
List<MovementsModel> movements;

MovementsCategoryModel(
  {
    required this.movements,
    required this.title
  }
);

factory MovementsCategoryModel.fromJson(Map<String, dynamic> json) => _$MovementsCategoryModelFromJson(json);
Map<String, dynamic> toJson() => _$MovementsCategoryModelToJson(this);
}
