abstract class LoginEvent {}

class LoadLoginDataEvent extends LoginEvent {}

class NameChanged extends LoginEvent {
  final String name;

  NameChanged(this.name);
}

class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged(this.email);
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged(this.password);
}

class MethodLoginChanged extends LoginEvent {
  final String methodLogin;

  MethodLoginChanged(this.methodLogin);
}

class LoginSubmitted extends LoginEvent {}
