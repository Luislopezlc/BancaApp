import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/movementsModel.dart';

abstract class DashboardEvent extends Equatable
{
  const DashboardEvent();
  @override
  List<Object?> get props => [];
}

class LoadDashboardDataEvent extends DashboardEvent{}

class NameChanged extends DashboardEvent
{
  final String name; 
  const NameChanged(this.name);
  @override
  List<Object?> get props => [name];
}


class MovementsChanged extends DashboardEvent
{
  final List<MovementsModel> movements; 
  const MovementsChanged(this.movements);
  @override
  List<Object?> get props => [movements];
}



class TotalAmountChanged extends DashboardEvent
{
  final double totalAmount;
  const TotalAmountChanged(this.totalAmount);
  @override
  List<Object?> get props => [totalAmount];
}

class IncomeChanged extends DashboardEvent
{
  final String income;
  const IncomeChanged(this.income);
  @override 
  List<Object?> get props => [income];
}


class BillsChanged extends DashboardEvent{

  final String bills;
  const BillsChanged(this.bills);
  @override
  List<Object?> get props => [bills];
}


class DashboardSubmitted extends DashboardEvent{}