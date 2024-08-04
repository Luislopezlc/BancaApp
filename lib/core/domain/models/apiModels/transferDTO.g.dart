// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferDTO _$TransferDTOFromJson(Map<String, dynamic> json) => TransferDTO(
      id: (json['id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      senderAccount: json['sender_account'] as String,
      receptorAccount: json['receptor_account'] as String,
      concept: json['concept'] as String,
      owner: json['owner'] as String,
    );

Map<String, dynamic> _$TransferDTOToJson(TransferDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'sender_account': instance.senderAccount,
      'receptor_account': instance.receptorAccount,
      'concept': instance.concept,
      'owner': instance.owner,
    };
