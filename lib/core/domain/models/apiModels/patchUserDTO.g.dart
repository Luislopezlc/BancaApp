// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patchUserDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchUserDTO _$PatchUserDTOFromJson(Map<String, dynamic> json) => PatchUserDTO(
      name: json['name'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      rfc: json['rfc'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$PatchUserDTOToJson(PatchUserDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastname': instance.lastname,
      'email': instance.email,
      'rfc': instance.rfc,
      'phone': instance.phone,
    };
