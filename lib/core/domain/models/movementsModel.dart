import 'package:json_annotation/json_annotation.dart';

part 'movementsModel.g.dart';

@JsonSerializable()
class MovementsModel
{
 String name;
 String date;
 double amount;
 String paymentType;

  MovementsModel({
    required this.name,
    required this.date,
    required this.amount,
    required this.paymentType,
  });

factory MovementsModel.fromJson(Map<String, dynamic> json) => _$MovementsModelFromJson(json);
Map<String, dynamic> toJson() => _$MovementsModelToJson(this);

}