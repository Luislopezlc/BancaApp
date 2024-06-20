import 'package:flutter_application_1/core/data/models/respositories/loginRepository.dart';
import 'package:flutter_application_1/core/domain/models/loginModel.dart';

class LoadLoginData {
  final LoginRepository repository;

  LoadLoginData(this.repository);
  
  Future<LoginModel> call () async {
    final loginData = await this.repository.loadLoginModel();

    if(loginData.email.isEmpty)
    {
      throw Exception("the field email cant be empty");
    }
    
    if(loginData.password.isEmpty)
    {
      throw Exception("the field password cant be empty");
    }

    if(loginData.password.length <= 7)
    {
      throw Exception("The password must be at least 8 characters long.");
    }
     return loginData;
  }
}