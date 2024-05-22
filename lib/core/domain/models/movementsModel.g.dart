// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movementsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovementsModel _$MovementsModelFromJson(Map<String, dynamic> json) =>
    MovementsModel(
      name: json['name'] as String,
      date: json['date'] as String,
      amount: (json['amount'] as num).toDouble(),
      paymentType: json['paymentType'] as String,
    );

Map<String, dynamic> _$MovementsModelToJson(MovementsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'amount': instance.amount,
      'paymentType': instance.paymentType,
    };
