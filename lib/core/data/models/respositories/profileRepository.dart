import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/userDTO.dart';
import 'package:flutter_application_1/core/domain/models/profileModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implProfileRepository.dart';

class profileRepository implements implProfileRepository
{
  @override
  Future<ProfileModel> loadProfileModel() async {
    final Map<String, dynamic> response =jsonDecode(await rootBundle.loadString("assets/json_data/profile.json"));
    return  ProfileModel.fromJson(response);
  }
  @override
  Future<UserDTO>getUser() async 
  {

     UserDTO user = UserDTO(
    id: null, // Puede ser nulo
    name: 'John',
    lastname: 'Doe',
    email: 'john.doe@example.com',
    rfc: 'JDOE123456HGT',
    phone: '123-456-7890',
    password: 'securepassword123',
    id_bank: 12345,
  );
    return user;
  }
}
