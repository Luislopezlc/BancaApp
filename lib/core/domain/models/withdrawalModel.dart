import 'package:json_annotation/json_annotation.dart';

part 'withdrawalModel.g.dart';

@JsonSerializable()


class withdrawalModel {
double maxAmountToRetire;
double amountToRetire;
String codeForRetire;

withdrawalModel({
      
      required this.maxAmountToRetire,
      required this.amountToRetire,
      required this.codeForRetire
  });

    factory withdrawalModel.fromJson(Map<String, dynamic> json) => _$withdrawalModelFromJson(json);
  Map<String, dynamic> toJson() => _$withdrawalModelToJson(this);
}