abstract class TransferEvent {}

class LoadTransferDataEvent extends TransferEvent {}

class NameChanged extends TransferEvent {
  final String name;

  NameChanged(this.name);
}

class IconTextChanged extends TransferEvent {
  final String iconText;

  IconTextChanged(this.iconText);
}

class CreditCardNumberChanged extends TransferEvent {
  final String creditCardNumber;

  CreditCardNumberChanged(this.creditCardNumber);
}

class TransferSubmitted extends TransferEvent {}
