import 'package:json_annotation/json_annotation.dart';

part 'ServiceDTO.g.dart';

@JsonSerializable()
class ServiceDTO {
  final int id;
  final String name;
  final bool status;
  final String icono;

  ServiceDTO({
    required this.id,
    required this.name,
    required this.status,
    required this.icono,
  });

  // Factory method to create a Transaction from JSON
  factory ServiceDTO.fromJson(Map<String, dynamic> json) => _$ServiceDTOFromJson(json);

  // Method to convert a Transaction to JSON
  Map<String, dynamic> toJson() => _$ServiceDTOToJson(this);

  // Factory method to create a list of Transactions from JSON
  static List<ServiceDTO> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ServiceDTO.fromJson(json as Map<String, dynamic>)).toList();
  }

  // Method to convert a list of Transactions to JSON
  static List<Map<String, dynamic>> toJsonList(List<ServiceDTO> transactions) {
    return transactions.map((transaction) => transaction.toJson()).toList();
  }
}
