// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      name: json['name'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      income: json['income'] as String,
      bills: json['bills'] as String,
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'totalAmount': instance.totalAmount,
      'income': instance.income,
      'bills': instance.bills,
    };
