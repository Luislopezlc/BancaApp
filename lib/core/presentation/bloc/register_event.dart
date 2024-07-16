import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/registerModel.dart';

abstract class RegisterEvent extends Equatable {

const RegisterEvent();
 @override
  List<Object> get props => [];
}


class RegisterSubmitted extends RegisterEvent {

  final RegisterModel register;

  const RegisterSubmitted(this.register);

  @override
  List<Object> get props => [register];
}
