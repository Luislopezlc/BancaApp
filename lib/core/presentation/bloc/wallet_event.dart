abstract class WalletEvent {}

class LoadWalletDataEvent extends WalletEvent {}

class NameChanged extends WalletEvent {
  final String name;

  NameChanged(this.name);
}

class CreditCardNumberChanged extends WalletEvent {
  final String creditCardNumber;

  CreditCardNumberChanged(this.creditCardNumber);
}

class DueDateChanged extends WalletEvent {
  final String dueDate;

  DueDateChanged(this.dueDate);
}

class CVVChanged extends WalletEvent {
  final String cVV;

  CVVChanged(this.cVV);
}

class WalletSubmitted extends WalletEvent {}
