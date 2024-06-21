// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walletModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) => WalletModel(
      name: json['name'] as String,
      creditCardNumber: json['creditCardNumber'] as String,
      dueDate: json['dueDate'] as String,
      cVV: json['cVV'] as String,
      imagenUrl: json['imagenUrl'] as String,
    );

Map<String, dynamic> _$WalletModelToJson(WalletModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'creditCardNumber': instance.creditCardNumber,
      'dueDate': instance.dueDate,
      'cVV': instance.cVV,
      'imagenUrl': instance.imagenUrl,
    };
