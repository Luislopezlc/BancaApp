import 'package:json_annotation/json_annotation.dart';

part 'loginModel.g.dart';

@JsonSerializable()
class LoginModel{
  String name;
  String email;
  String password;
  String methodLogin;

LoginModel ({
required this.name,
required this.email,
required this.password,
required this.methodLogin
}); 

factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
Map<String, dynamic> toJson() => _$LoginModelToJson(this);

}