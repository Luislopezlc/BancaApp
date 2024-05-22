import 'package:json_annotation/json_annotation.dart';

part 'ServicesModel.g.dart';

@JsonSerializable()
class ServicesModel{
String name;
String clientName;
String numberOfReference;
String amountOfPayment;


  ServicesModel({
 required this.name,
 required this.clientName,
 required this.numberOfReference,
 required this.amountOfPayment,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) => _$ServicesModelFromJson(json);
Map<String, dynamic> toJson() => _$ServicesModelToJson(this);
}