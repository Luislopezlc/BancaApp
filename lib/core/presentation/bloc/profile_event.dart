abstract class ProfileEvent {}

class LoadProfileDataEvent extends ProfileEvent {}

class NameChanged extends ProfileEvent {
  final String name;

  NameChanged(this.name);
}

class EmailChanged extends ProfileEvent {
  final String email;

  EmailChanged(this.email);
}

class NumberChanged extends ProfileEvent {
  final String number;

  NumberChanged(this.number);
}

class AddressChanged extends ProfileEvent {
  final String address;

  AddressChanged(this.address);
}

class ProfileSubmitted extends ProfileEvent {}
