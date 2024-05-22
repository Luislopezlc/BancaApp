// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServicesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesModel _$ServicesModelFromJson(Map<String, dynamic> json) =>
    ServicesModel(
      name: json['name'] as String,
      clientName: json['clientName'] as String,
      numberOfReference: json['numberOfReference'] as String,
      amountOfPayment: json['amountOfPayment'] as String,
    );

Map<String, dynamic> _$ServicesModelToJson(ServicesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'clientName': instance.clientName,
      'numberOfReference': instance.numberOfReference,
      'amountOfPayment': instance.amountOfPayment,
    };
