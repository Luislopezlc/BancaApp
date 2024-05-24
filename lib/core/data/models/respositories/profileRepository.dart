import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/models/profileModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implProfileRepository.dart';

class profileRepository implements implProfileRepository
{
  @override
  Future<ProfileModel> loadProfileModel() async {
    final Map<String, dynamic> response =jsonDecode(await rootBundle.loadString('assets/json_data/profile.json'));
    return  ProfileModel.fromJson(response);
  }
}
