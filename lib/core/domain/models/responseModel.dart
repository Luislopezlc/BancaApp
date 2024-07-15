import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()

class ResponseModel{
  Object data;
  List<String> errors;

ResponseModel ({
required this.data,
required this.errors
});

ResponseModel responseModelFromJson(Map<String, dynamic> json) =>
    ResponseModel(
      data: json['data'] as Object,
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> responseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errors': instance.errors,
    };
}