import 'package:json_annotation/json_annotation.dart';

part 'transferDTO.g.dart';

@JsonSerializable()
class TransferDTO {
  final int id;
  final double amount;
  @JsonKey(name: 'sender_account')
  final String senderAccount;
  @JsonKey(name: 'receptor_account')
  final String receptorAccount;
  final String concept;
  final String owner;

  TransferDTO({
    required this.id,
    required this.amount,
    required this.senderAccount,
    required this.receptorAccount,
    required this.concept,
    required this.owner,
  });

  // Factory method to create a Transaction from JSON
  factory TransferDTO.fromJson(Map<String, dynamic> json) => _$TransferDTOFromJson(json);

  // Method to convert a Transaction to JSON
  Map<String, dynamic> toJson() => _$TransferDTOToJson(this);

   // Factory method to create a list of Transactions from JSON
  static List<TransferDTO> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => TransferDTO.fromJson(json as Map<String, dynamic>)).toList();
  }

  // Method to convert a list of Transactions to JSON
  static List<Map<String, dynamic>> toJsonList(List<TransferDTO> transactions) {
    return transactions.map((transaction) => transaction.toJson()).toList();
  }
}
