import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/registerModel.dart';

class RegisterState extends Equatable {
  final int? id;
  final String name;
  final String lastname;
  final String email;
  final String rfc;
  final String phone;
  final String password;
  final int idBank;
  final bool isValid;

  const RegisterState({
    this.id,
    this.name = '',
    this.lastname = '',
    this.email = '',
    this.rfc = '',
    this.phone = '',
    this.password = '',
    this.idBank = 0,
    this.isValid = false,
  });

  factory RegisterState.fromModel(RegisterModel model) {
    return RegisterState(
      id: model.id,
      name: model.name,
      lastname: model.lastname,
      email: model.email,
      rfc: model.rfc,
      phone: model.phone,
      password: model.password,
      idBank: model.idBank,
      isValid: true,
    );
  }

  RegisterState copyWith({
    int? id,
    String? name,
    String? lastname,
    String? email,
    String? rfc,
    String? phone,
    String? password,
    int? idBank,
    bool? isValid,
  }) {
    return RegisterState(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      rfc: rfc ?? this.rfc,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      idBank: idBank ?? this.idBank,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        lastname,
        email,
        rfc,
        phone,
        password,
        idBank,
        isValid,
      ];
}
