// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accountDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDTO _$AccountDTOFromJson(Map<String, dynamic> json) => AccountDTO(
      id: (json['id'] as num).toInt(),
      idUser: (json['id_user'] as num).toInt(),
      balance: (json['balance'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      card: (json['card'] as List<dynamic>)
          .map((e) => CardDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountDTOToJson(AccountDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'balance': instance.balance,
      'status': instance.status,
      'card': instance.card.map((e) => e.toJson()).toList(),
      'user': instance.user.toJson(),
    };
