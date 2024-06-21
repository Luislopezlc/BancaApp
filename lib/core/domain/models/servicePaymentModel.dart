


import 'package:json_annotation/json_annotation.dart';

part 'servicePaymentModel.g.dart';

@JsonSerializable()
class ServicePaymentModel {
String name;
String imagenUrl;
ServicePaymentModel(
  {
    required this.name,
    required this.imagenUrl
  }
);
 factory ServicePaymentModel.fromJson(Map<String, dynamic> json) => _$ServicePaymentModelFromJson(json);
Map<String, dynamic> toJson() => _$ServicePaymentModelToJson(this);
}