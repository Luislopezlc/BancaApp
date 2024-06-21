import 'package:flutter_application_1/core/domain/models/servicePaymentModel.dart';
import 'package:json_annotation/json_annotation.dart';



part 'listServicesModel.g.dart';
@JsonSerializable()


class ListServicesModel {

List<ServicePaymentModel> services;

ListServicesModel({
required this.services, 
});


 factory ListServicesModel.fromJson(Map<String, dynamic> json) => _$ListServicesModelFromJson(json);
Map<String, dynamic> toJson() => _$ListServicesModelToJson(this);

}