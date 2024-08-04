// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServiceDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceDTO _$ServiceDTOFromJson(Map<String, dynamic> json) => ServiceDTO(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as bool,
      icono: json['icono'] as String,
    );

Map<String, dynamic> _$ServiceDTOToJson(ServiceDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'icono': instance.icono,
    };
