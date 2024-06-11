abstract class RegisterEvent {}

class LoadRegisterDataEvent extends RegisterEvent {}

class NameChanged extends RegisterEvent {
  final String name;

  NameChanged(this.name);
}

class LastnameChanged extends RegisterEvent {
  final String lastname;

  LastnameChanged(this.lastname);
}

class EmailChanged extends RegisterEvent {
  final String email;

  EmailChanged(this.email);
}

class RfcChanged extends RegisterEvent {
  final String rfc;

  RfcChanged(this.rfc);
}

class PhoneChanged extends RegisterEvent {
  final String phone;

  PhoneChanged(this.phone);
}

class PasswordChanged extends RegisterEvent {
  final String password;

  PasswordChanged(this.password);
}

class IdBankChanged extends RegisterEvent {
  final int idBank;

  IdBankChanged(this.idBank);
}

class RegisterSubmitted extends RegisterEvent {}
