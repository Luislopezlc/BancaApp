import 'package:equatable/equatable.dart';

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