
import 'package:flutter_application_1/core/domain/models/walletModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listWalletModel.g.dart';

@JsonSerializable()

class ListWalletModel
{
 List<WalletModel> cards;

  ListWalletModel({
  required this.cards
  });

  factory ListWalletModel.fromJson(Map<String, dynamic> json) => _$ListWalletModelFromJson(json);
Map<String, dynamic> toJson() => _$ListWalletModelToJson(this);

}

