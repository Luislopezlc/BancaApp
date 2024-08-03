import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/ResponseModel.dart';
import 'package:flutter_application_1/core/domain/models/registerModel.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}
class RegisterLoading extends RegisterState {}
class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {
 final String message;

const RegisterSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class RegisterError extends RegisterState {
  final String message;

  const RegisterError(this.message);

  @override
  List<Object> get props => [message];
}
