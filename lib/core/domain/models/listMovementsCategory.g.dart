// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listMovementsCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMovementsCategoryModel _$ListMovementsCategoryModelFromJson(
        Map<String, dynamic> json) =>
    ListMovementsCategoryModel(
      movements: (json['movements'] as List<dynamic>)
          .map(
              (e) => MovementsCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListMovementsCategoryModelToJson(
        ListMovementsCategoryModel instance) =>
    <String, dynamic>{
      'movements': instance.movements,
    };
