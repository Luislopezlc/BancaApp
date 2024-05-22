import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_application_1/core/domain/models/movementsModel.dart';

part 'dashboardModel.g.dart';

@JsonSerializable()
class DashboardModel
{
 String name;
 double totalAmount;
 String income;
 String bills;
///List<MovementsModel> movements;


DashboardModel({
  required this.name,
  required this.totalAmount,
  required this.income,
  required this.bills,
  //required this.movements
});

factory DashboardModel.fromJson(Map<String, dynamic> json) => _$DashboardModelFromJson(json);
Map<String, dynamic> toJson() => _$DashboardModelToJson(this);
}