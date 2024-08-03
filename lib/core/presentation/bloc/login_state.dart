import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/loginModel.dart';
class LoginState extends Equatable {

  const LoginState();
  
  @override
  List<Object> get props => [];
  
}

  // factory LoginState.fromModel(LoginModel model) {
  //   return LoginState(
  //     name: model.name,
  //     email: model.email,
  //     password: model.password,
  //     methodLogin: model.methodLogin,
  //     isValid: true,
  //   );
  // }

  // LoginState copyWith({
  //   String? name,
  //   String? email,
  //   String? password,
  //   String? methodLogin,
  //   bool? isValid,
  // }) {
  //   return LoginState(
  //     name: name ?? this.name,
  //     email: email ?? this.email,
  //     password: password ?? this.password,
  //     methodLogin: methodLogin ?? this.methodLogin,
  //     isValid: isValid ?? this.isValid,
  //   );
  // }

  // @override
  // List<Object?> get props => [
  //       name,
  //       email,
  //       password,
  //       methodLogin,
  //       isValid,
  //     ];


class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginError extends LoginState {
 final String message;
 const LoginError(this.message);
 @override
  List<Object> get props => [message];
}