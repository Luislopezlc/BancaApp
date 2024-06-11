abstract class ServicesEvent {}

class LoadServicesDataEvent extends ServicesEvent {}

class NameChanged extends ServicesEvent {
  final String name;

  NameChanged(this.name);
}

class ClientNameChanged extends ServicesEvent {
  final String clientName;

  ClientNameChanged(this.clientName);
}

class NumberOfReferenceChanged extends ServicesEvent {
  final String numberOfReference;

  NumberOfReferenceChanged(this.numberOfReference);
}

class AmountOfPaymentChanged extends ServicesEvent {
  final String amountOfPayment;

  AmountOfPaymentChanged(this.amountOfPayment);
}

class ServicesSubmitted extends ServicesEvent {}
