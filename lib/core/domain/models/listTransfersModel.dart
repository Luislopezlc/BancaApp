


import 'package:flutter_application_1/core/domain/models/transfersModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listTransfersModel.g.dart';

@JsonSerializable()
class ListTransfersModel {

List<TransferModel> transfer;

ListTransfersModel({
required this.transfer, 
});

  factory ListTransfersModel.fromJson(Map<String, dynamic> json) => _$ListTransfersModelFromJson(json);
Map<String, dynamic> toJson() => _$ListTransfersModelToJson(this);

}