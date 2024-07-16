import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/registerModel.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterError extends RegisterState {
  final String message;

  const RegisterError(this.message);

  @override
  List<Object> get props => [message];
}
