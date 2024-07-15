import 'package:json_annotation/json_annotation.dart';

part 'responseModel.g.dart';

@JsonSerializable()


class ResponseModel{
  Object data;
  List<String> errors;

ResponseModel ({
required this.data,
required this.errors
}); 


factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);
Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}