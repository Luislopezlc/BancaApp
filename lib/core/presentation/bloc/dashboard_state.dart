import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/dashboardModel.dart';

class DashboardState extends Equatable {
  final String name;
  final double totalAmount;
  final String income;
  final String bills;
  // final List<MovementsModel> movements; // Descomenta esto si MovementsModel está definido y quieres incluirlo
  final bool isValid;

  const DashboardState({
    this.name = '',
    this.totalAmount = 0.0,
    this.income = '',
    this.bills = '',
    // this.movements = const [], // Descomenta esto si MovementsModel está definido y quieres incluirlo
    this.isValid = false,
  });

  factory DashboardState.fromModel(DashboardModel model) {
    return DashboardState(
      name: model.name,
      totalAmount: model.totalAmount,
      income: model.income,
      bills: model.bills,
      // movements: model.movements, // Descomenta esto si MovementsModel está definido y quieres incluirlo
      isValid: true,
    );
  }

  DashboardState copyWith({
    String? name,
    double? totalAmount,
    String? income,
    String? bills,
    // List<MovementsModel>? movements, // Descomenta esto si MovementsModel está definido y quieres incluirlo
    bool? isValid,
  }) {
    return DashboardState(
      name: name ?? this.name,
      totalAmount: totalAmount ?? this.totalAmount,
      income: income ?? this.income,
      bills: bills ?? this.bills,
      // movements: movements ?? this.movements, // Descomenta esto si MovementsModel está definido y quieres incluirlo
      isValid: isValid ?? this.isValid,
    );
  }

 @override
  List<Object?> get props => [
        name,
        totalAmount,
        income,
        bills,
        // movements, // Descomenta esto si MovementsModel está definido y quieres incluirlo
        isValid,
      ];
}