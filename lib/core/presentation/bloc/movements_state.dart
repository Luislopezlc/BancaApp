import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/movementsModel.dart';

class MovementsState extends Equatable {
  final String name;
  final String date;
  final double amount;
  final String paymentType;
  final bool isValid;

  const MovementsState({
    this.name = '',
    this.date = '',
    this.amount = 0.0,
    this.paymentType = '',
    this.isValid = false,
  });

  factory MovementsState.fromModel(MovementsModel model) {
    return MovementsState(
      name: model.name,
      date: model.date,
      amount: model.amount,
      paymentType: model.paymentType,
      isValid: true,
    );
  }

  MovementsState copyWith({
    String? name,
    String? date,
    double? amount,
    String? paymentType,
    bool? isValid,
  }) {
    return MovementsState(
      name: name ?? this.name,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      paymentType: paymentType ?? this.paymentType,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        name,
        date,
        amount,
        paymentType,
        isValid,
      ];
}
