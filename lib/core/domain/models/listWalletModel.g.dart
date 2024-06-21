// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listWalletModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListWalletModel _$ListWalletModelFromJson(Map<String, dynamic> json) =>
    ListWalletModel(
      cards: (json['cards'] as List<dynamic>)
          .map((e) => WalletModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListWalletModelToJson(ListWalletModel instance) =>
    <String, dynamic>{
      'cards': instance.cards,
    };
