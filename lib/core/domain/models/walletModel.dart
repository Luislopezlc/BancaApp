import 'package:json_annotation/json_annotation.dart';

part 'walletModel.g.dart';

@JsonSerializable()

class WalletModel
{
  String name;
  String creditCardNumber;
  String dueDate;
  String cVV;
  String imagenUrl;

  WalletModel({
  required this.name,
  required this.creditCardNumber,
  required this.dueDate,
  required this.cVV,
  required this.imagenUrl,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);
  Map<String, dynamic> toJson() => _$WalletModelToJson(this);

}