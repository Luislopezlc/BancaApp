import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/loginModel.dart';
class LoginState extends Equatable {
  final String name;
  final String email;
  final String password;
  final String methodLogin;
  final bool isValid;

  const LoginState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.methodLogin = '',
    this.isValid = false,
  });

  factory LoginState.fromModel(LoginModel model) {
    return LoginState(
      name: model.name,
      email: model.email,
      password: model.password,
      methodLogin: model.methodLogin,
      isValid: true,
    );
  }

  LoginState copyWith({
    String? name,
    String? email,
    String? password,
    String? methodLogin,
    bool? isValid,
  }) {
    return LoginState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      methodLogin: methodLogin ?? this.methodLogin,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        methodLogin,
        isValid,
      ];
}