import 'package:json_annotation/json_annotation.dart';

part 'profileModel.g.dart';

@JsonSerializable()

class ProfileModel {
  String name;
  String email;
  String number;
  String address;

  ProfileModel({
required this.name,
required this.email,
required this.number,
required this.address
  });

factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}