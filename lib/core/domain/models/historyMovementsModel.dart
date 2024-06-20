import 'package:flutter_application_1/core/domain/models/movementsModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'historyMovementsModel.g.dart';

@JsonSerializable()
class HistoryMovementsModel{

List<MovementsModel> movements;

HistoryMovementsModel ({
required this.movements
}); 

factory HistoryMovementsModel.fromJson(Map<String, dynamic> json) => _$HistoryMovementsModelFromJson(json);
Map<String, dynamic> toJson() => _$HistoryMovementsModelToJson(this);

}