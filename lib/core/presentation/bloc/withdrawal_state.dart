import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/withdrawalModel.dart';

class WithdrawalState extends Equatable {
  final double maxAmountToRetire;
  final double amountToRetire;
  final String codeForRetire;
  final bool isValid;

  const WithdrawalState({
    this.maxAmountToRetire = 0.0,
    this.amountToRetire = 0.0,
    this.codeForRetire = '',
    this.isValid = false,
  });

  factory WithdrawalState.fromModel(withdrawalModel model) {
    return WithdrawalState(
      maxAmountToRetire: model.maxAmountToRetire,
      amountToRetire: model.amountToRetire,
      codeForRetire: model.codeForRetire,
      isValid: true,
    );
  }

  WithdrawalState copyWith({
    double? maxAmountToRetire,
    double? amountToRetire,
    String? codeForRetire,
    bool? isValid,
  }) {
    return WithdrawalState(
      maxAmountToRetire: maxAmountToRetire ?? this.maxAmountToRetire,
      amountToRetire: amountToRetire ?? this.amountToRetire,
      codeForRetire: codeForRetire ?? this.codeForRetire,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        maxAmountToRetire,
        amountToRetire,
        codeForRetire,
        isValid,
      ];
}
