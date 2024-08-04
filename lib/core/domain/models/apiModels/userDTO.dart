
import 'package:json_annotation/json_annotation.dart';

part 'userDTO.g.dart';

@JsonSerializable()

class UserDTO{
  int? id; // Puede ser nulo
  late String name;
  late String lastname;
  late String email;
  late String rfc;
  late String phone;
  late String password;
  late int id_bank;

  // Constructor
  UserDTO({
    this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.rfc,
    required this.phone,
    required this.password,
    required this.id_bank,
  });
  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);
Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}