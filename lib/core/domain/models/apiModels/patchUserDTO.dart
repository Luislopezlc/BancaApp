import 'package:json_annotation/json_annotation.dart';

part 'patchUserDTO.g.dart';

@JsonSerializable()
class PatchUserDTO {
  final String name;
  final String lastname;
  final String email;
  final String rfc;
  final String phone;

  PatchUserDTO({
    required this.name,
    required this.lastname,
    required this.email,
    required this.rfc,
    required this.phone,
  });

  // Factory method to create a User from JSON
  factory PatchUserDTO.fromJson(Map<String, dynamic> json) => _$PatchUserDTOFromJson(json);

  // Method to convert a User to JSON
  Map<String, dynamic> toJson() => _$PatchUserDTOToJson(this);
}
