import 'package:flutter_application_1/core/domain/models/apiModels/patchUserDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/userDTO.dart';
import 'package:flutter_application_1/core/domain/models/profileModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';

abstract class implProfileRepository
{
Future<ProfileModel> loadProfileModel();
Future<ResponseAPI> getUser();
Future<ResponseAPI> patchUser(PatchUserDTO user);
}