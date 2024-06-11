abstract class WithdrawalEvent {}

class LoadWithdrawalDataEvent extends WithdrawalEvent {}

class MaxAmountToRetireChanged extends WithdrawalEvent {
  final double maxAmountToRetire;

  MaxAmountToRetireChanged(this.maxAmountToRetire);
}

class AmountToRetireChanged extends WithdrawalEvent {
  final double amountToRetire;

  AmountToRetireChanged(this.amountToRetire);
}

class CodeForRetireChanged extends WithdrawalEvent {
  final String codeForRetire;

  CodeForRetireChanged(this.codeForRetire);
}

class WithdrawalSubmitted extends WithdrawalEvent {}
