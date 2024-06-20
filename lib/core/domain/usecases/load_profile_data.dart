import 'package:flutter_application_1/core/data/models/respositories/profileRepository.dart';
import 'package:flutter_application_1/core/domain/models/profileModel.dart';

class LoadProfileData {
  final profileRepository repository;

  LoadProfileData(this.repository);
  
  Future<ProfileModel> call () async {
    final profileData = await repository.loadProfileModel();

    if(profileData.name.isEmpty)
    {
      throw Exception("the field name cant be empty");
    }
    
    if(profileData.address.isEmpty)
    {
      throw Exception("the field address cant be empty");
    }

    if(profileData.number.isEmpty)
    {
      throw Exception("the field number cant be empty");
    }

    if(profileData.email.isEmpty)
    {
      throw Exception("the field email cant be empty");
    }
    print(profileData);
     return profileData;
  }
}