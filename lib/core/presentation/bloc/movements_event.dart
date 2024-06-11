abstract class MovementsEvent {}

class LoadMovementsDataEvent extends MovementsEvent {}

class NameChanged extends MovementsEvent {
  final String name;

  NameChanged(this.name);
}

class DateChanged extends MovementsEvent {
  final String date;

  DateChanged(this.date);
}

class AmountChanged extends MovementsEvent {
  final double amount;

  AmountChanged(this.amount);
}

class PaymentTypeChanged extends MovementsEvent {
  final String paymentType;

  PaymentTypeChanged(this.paymentType);
}

class MovementsSubmitted extends MovementsEvent {}
