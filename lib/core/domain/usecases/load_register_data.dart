import 'package:flutter_application_1/core/data/models/respositories/registerRepository.dart';
import 'package:flutter_application_1/core/domain/models/registerModel.dart';

class LoadRegisterData {
  final RegisterRepository repository;

  LoadRegisterData(this.repository);

  Future<RegisterModel> call() async {
    final loginData = await repository.loadRegisterModel();

    _validateEmail(loginData.email);
    _validatePassword(loginData.password);
    _validateRFC(loginData.rfc);

    return loginData;
  }

  void _validateEmail(String email) {
    if (email.isEmpty) {
      throw Exception("El campo de correo electrónico no puede estar vacío");
    }
    if (!isValidEmail(email)) {
      throw Exception("El formato del correo electrónico no es válido");
    }
  }

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(
        r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$', // Patrón básico para validar direcciones de correo electrónico
        caseSensitive: false,
    );
    return emailRegExp.hasMatch(email);
  }

  void _validatePassword(String password) {
    if (password.isEmpty) {
      throw Exception("El campo de contraseña no puede estar vacío");
    }
    if (password.length < 8) {
      throw Exception("La contraseña debe tener al menos 8 caracteres");
    }
    if (!containsUpperCase(password) || !containsLowerCase(password) || !containsDigit(password)) {
      throw Exception("La contraseña debe contener al menos una letra mayúscula, una letra minúscula y un dígito");
    }
  }

  bool containsUpperCase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  bool containsLowerCase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }

  bool containsDigit(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

  void _validateRFC(String rfc) {
    if (rfc.isEmpty) {
      throw Exception("El campo RFC no puede estar vacío");
    }
    if (!isValidRFC(rfc)) {
      throw Exception("El RFC debe tener un formato válido");
    }
  }

  bool isValidRFC(String rfc) {
    final rfcRegExp = RegExp(
      r'^[A-ZÑ&]{3,4}\d{6}(?:[A-Z\d]{3})?$',
      caseSensitive: false,
    );
    return rfcRegExp.hasMatch(rfc);
  }
}

