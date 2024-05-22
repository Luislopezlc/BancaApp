import 'package:json_annotation/json_annotation.dart';

part 'transfersModel.g.dart';

@JsonSerializable()
class TransferModel{
String name;
String iconText;
String creditCardNumber;

  TransferModel({
required this.name,
required this.iconText,
required this.creditCardNumber,
  });

  factory TransferModel.fromJson(Map<String, dynamic> json) => _$TransferModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransferModelToJson(this);
}