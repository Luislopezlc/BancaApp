// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactDTO _$ContactDTOFromJson(Map<String, dynamic> json) => ContactDTO(
      id: (json['id'] as num).toInt(),
      idUser: (json['id_user'] as num).toInt(),
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      bankname: json['bankname'] as String,
      account: json['account'] as String,
    );

Map<String, dynamic> _$ContactDTOToJson(ContactDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'nickname': instance.nickname,
      'email': instance.email,
      'phone': instance.phone,
      'bankname': instance.bankname,
      'account': instance.account,
    };
