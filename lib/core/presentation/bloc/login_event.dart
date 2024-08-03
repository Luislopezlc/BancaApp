import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/loginDTO.dart';

abstract class LoginEvent extends Equatable {

const LoginEvent();
 @override
  List<Object> get props => [];
}

class LoginSubmitted extends LoginEvent {
  final LoginDTO credentials;
  
  const LoginSubmitted(this.credentials);

  @override
  List<Object> get props => [credentials];
}
