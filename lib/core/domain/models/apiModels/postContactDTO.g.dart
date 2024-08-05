// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postContactDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostContactDTO _$PostContactDTOFromJson(Map<String, dynamic> json) =>
    PostContactDTO(
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      bankname: json['bankname'] as String,
      account: json['account'] as String,
    );

Map<String, dynamic> _$PostContactDTOToJson(PostContactDTO instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'email': instance.email,
      'phone': instance.phone,
      'bankname': instance.bankname,
      'account': instance.account,
    };
