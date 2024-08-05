// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postServiceDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostServiceDTO _$PostServiceDTOFromJson(Map<String, dynamic> json) =>
    PostServiceDTO(
      idService: (json['id_service'] as num).toInt(),
      idUsers: (json['id_users'] as num).toInt(),
      idAccount: (json['id_account'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      reference: json['reference'] as String,
    );

Map<String, dynamic> _$PostServiceDTOToJson(PostServiceDTO instance) =>
    <String, dynamic>{
      'id_service': instance.idService,
      'id_users': instance.idUsers,
      'id_account': instance.idAccount,
      'amount': instance.amount,
      'reference': instance.reference,
    };
