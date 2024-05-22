// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawalModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

withdrawalModel _$withdrawalModelFromJson(Map<String, dynamic> json) =>
    withdrawalModel(
      maxAmountToRetire: (json['maxAmountToRetire'] as num).toDouble(),
      amountToRetire: (json['amountToRetire'] as num).toDouble(),
      codeForRetire: json['codeForRetire'] as String,
    );

Map<String, dynamic> _$withdrawalModelToJson(withdrawalModel instance) =>
    <String, dynamic>{
      'maxAmountToRetire': instance.maxAmountToRetire,
      'amountToRetire': instance.amountToRetire,
      'codeForRetire': instance.codeForRetire,
    };
