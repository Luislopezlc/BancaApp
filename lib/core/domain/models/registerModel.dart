import 'package:json_annotation/json_annotation.dart';

part 'registerModel.g.dart';

@JsonSerializable()

class RegisterModel{
  int? id; // Puede ser nulo
  late String name;
  late String lastname;
  late String email;
  late String rfc;
  late String phone;
  late String password;
  late int id_bank;

  // Constructor
  RegisterModel({
    this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.rfc,
    required this.phone,
    required this.password,
    required this.id_bank,
  });
  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);
Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}