// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listServicesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListServicesModel _$ListServicesModelFromJson(Map<String, dynamic> json) =>
    ListServicesModel(
      services: (json['services'] as List<dynamic>)
          .map((e) => ServicePaymentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListServicesModelToJson(ListServicesModel instance) =>
    <String, dynamic>{
      'services': instance.services,
    };
