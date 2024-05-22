// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      methodLogin: json['methodLogin'] as String,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'methodLogin': instance.methodLogin,
    };
