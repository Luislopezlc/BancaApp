import 'package:flutter_application_1/core/data/models/respositories/profileRepository.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/patchUserDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/userDTO.dart';
import 'package:flutter_application_1/core/domain/models/profileModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';

class LoadProfileData {
  final profileRepository repository;

  LoadProfileData(this.repository);
  
  Future<ProfileModel> call () async {
    final profileData = await repository.loadProfileModel();
    return profileData;
  }

  Future<ResponseAPI> getUser() async
  {
    ResponseAPI result = ResponseAPI(status: '400', data: {});

    ProfileModel profileModel = ProfileModel(name: '', lastname: '', email: '', number: '', rfc: '');

    var responseUser = await repository.getUser();

    if(responseUser.status != '200')
    {
      return responseUser;
    }

    if(responseUser.data is UserDTO)
    {
      var user = responseUser.data as UserDTO;

      profileModel.name = user.name;
      profileModel.lastname = user.lastname;
      profileModel.email = user.email;
      profileModel.number = user.phone;
      profileModel.rfc = user.rfc;
    }

    result.data = profileModel;
    result.status = '200';
    return result;
  }

  Future<ResponseAPI> patchUser(PatchUserDTO user) async
  {
    ResponseAPI result = ResponseAPI(status: '400', data: {});
    
    var responseUser = await repository.patchUser(user);

    if(responseUser.status != '200')
    {
      return responseUser;
    }
    result.status = '200';
    result.message = 'Los datos del perfil han sido guardados exitosamente.';
    return result;
  }

}