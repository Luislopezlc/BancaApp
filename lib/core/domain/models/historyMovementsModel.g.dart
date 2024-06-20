// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historyMovementsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryMovementsModel _$HistoryMovementsModelFromJson(
        Map<String, dynamic> json) =>
    HistoryMovementsModel(
      movements: (json['movements'] as List<dynamic>)
          .map((e) => MovementsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryMovementsModelToJson(
        HistoryMovementsModel instance) =>
    <String, dynamic>{
      'movements': instance.movements,
    };
