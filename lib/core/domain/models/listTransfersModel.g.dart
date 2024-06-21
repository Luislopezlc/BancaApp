// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listTransfersModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListTransfersModel _$ListTransfersModelFromJson(Map<String, dynamic> json) =>
    ListTransfersModel(
      transfer: (json['transfer'] as List<dynamic>)
          .map((e) => TransferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListTransfersModelToJson(ListTransfersModel instance) =>
    <String, dynamic>{
      'transfer': instance.transfer,
    };
