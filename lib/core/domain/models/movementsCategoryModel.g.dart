// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movementsCategoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovementsCategoryModel _$MovementsCategoryModelFromJson(
        Map<String, dynamic> json) =>
    MovementsCategoryModel(
      movements: (json['movements'] as List<dynamic>)
          .map((e) => MovementsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$MovementsCategoryModelToJson(
        MovementsCategoryModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'movements': instance.movements,
    };
