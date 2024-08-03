import 'package:json_annotation/json_annotation.dart';

part 'loginDTO.g.dart';  // Este archivo se generará automáticamente

@JsonSerializable()
class LoginDTO {
  final String phone;
  final String password;

  LoginDTO({
    required this.phone,
    required this.password,
  });

  // Factory constructor para deserializar JSON a objeto Dart
  factory LoginDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginDTOFromJson(json);

  // Método para serializar objeto Dart a JSON
  Map<String, dynamic> toJson() => _$LoginDTOToJson(this);
}
