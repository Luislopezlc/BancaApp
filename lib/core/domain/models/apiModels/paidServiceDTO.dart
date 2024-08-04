import 'package:json_annotation/json_annotation.dart';

part 'paidServiceDTO.g.dart';

@JsonSerializable()
class PaidServiceDTO {
  final int id;
  final String amount; // amount as String to match the JSON
  final String reference;
  @JsonKey(name: 'id_service')
  final int idService;
  @JsonKey(name: 'id_users')
  final int idUsers;
  @JsonKey(name: 'id_account')
  final int idAccount;

  PaidServiceDTO({
    required this.id,
    required this.amount,
    required this.reference,
    required this.idService,
    required this.idUsers,
    required this.idAccount,
  });

  // Factory method to create a Transaction from JSON
  factory PaidServiceDTO.fromJson(Map<String, dynamic> json) => _$PaidServiceDTOFromJson(json);

  // Method to convert a Transaction to JSON
  Map<String, dynamic> toJson() => _$PaidServiceDTOToJson(this);


   // Factory method to create a list of Transactions from JSON
  static List<PaidServiceDTO> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => PaidServiceDTO.fromJson(json as Map<String, dynamic>)).toList();
  }

  // Method to convert a list of Transactions to JSON
  static List<Map<String, dynamic>> toJsonList(List<PaidServiceDTO> transactions) {
    return transactions.map((transaction) => transaction.toJson()).toList();
}
}