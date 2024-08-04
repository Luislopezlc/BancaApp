import 'package:json_annotation/json_annotation.dart';

part 'cardDTO.g.dart';

@JsonSerializable()
class CardDTO {
  final int id;
  @JsonKey(name: 'id_account')
  final int idAccount;
  @JsonKey(name: 'card')
  final String cardNumber;
  @JsonKey(name: 'card_account')
  final String cardAccount;
  final int status;

  CardDTO({
    required this.id,
    required this.idAccount,
    required this.cardNumber,
    required this.cardAccount,
    required this.status,
  });

  factory CardDTO.fromJson(Map<String, dynamic> json) => _$CardDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CardDTOToJson(this);
}
