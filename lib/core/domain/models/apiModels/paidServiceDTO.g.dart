// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paidServiceDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaidServiceDTO _$PaidServiceDTOFromJson(Map<String, dynamic> json) =>
    PaidServiceDTO(
      id: (json['id'] as num).toInt(),
      amount: json['amount'] as String,
      reference: json['reference'] as String,
      idService: (json['id_service'] as num).toInt(),
      idUsers: (json['id_users'] as num).toInt(),
      idAccount: (json['id_account'] as num).toInt(),
    );

Map<String, dynamic> _$PaidServiceDTOToJson(PaidServiceDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'reference': instance.reference,
      'id_service': instance.idService,
      'id_users': instance.idUsers,
      'id_account': instance.idAccount,
    };
