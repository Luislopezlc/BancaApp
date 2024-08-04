// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDTO _$CardDTOFromJson(Map<String, dynamic> json) => CardDTO(
      id: (json['id'] as num).toInt(),
      idAccount: (json['id_account'] as num).toInt(),
      cardNumber: json['card'] as String,
      cardAccount: json['card_account'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$CardDTOToJson(CardDTO instance) => <String, dynamic>{
      'id': instance.id,
      'id_account': instance.idAccount,
      'card': instance.cardNumber,
      'card_account': instance.cardAccount,
      'status': instance.status,
    };
