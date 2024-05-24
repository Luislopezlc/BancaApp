import 'package:flutter_application_1/core/domain/models/profileModel.dart';

abstract class implProfileRepository
{
Future<ProfileModel> loadProfileModel();
}