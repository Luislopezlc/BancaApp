// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfersModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferModel _$TransferModelFromJson(Map<String, dynamic> json) =>
    TransferModel(
      name: json['name'] as String,
      iconText: json['iconText'] as String,
      creditCardNumber: json['creditCardNumber'] as String,
    );

Map<String, dynamic> _$TransferModelToJson(TransferModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'iconText': instance.iconText,
      'creditCardNumber': instance.creditCardNumber,
    };
