import 'dart:ffi';

import 'package:flutter_application_1/core/domain/models/movementsModel.dart';

class DashboardModel
{
 String name;
 Double TotalAmount;
 String Income;
 String Bills;
List<MovementsModel> movements;


DashboardModel({
  required this.name,
  required this.TotalAmount,
  required this.Income,
  required this.Bills,
  required this.movements
});
}