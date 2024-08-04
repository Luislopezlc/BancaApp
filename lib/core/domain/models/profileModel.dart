import 'package:json_annotation/json_annotation.dart';

part 'profileModel.g.dart';

@JsonSerializable()

class ProfileModel {
  String name;
  String lastname;
  String email;
  String number;
  String rfc;

  ProfileModel({
required this.name,
required this.lastname,
required this.email,
required this.number,
required this.rfc
  });

factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}