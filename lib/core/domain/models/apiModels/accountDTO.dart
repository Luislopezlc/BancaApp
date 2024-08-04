import 'package:flutter_application_1/core/domain/models/apiModels/cardDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/userDTO.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accountDTO.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountDTO {
  final int id;
  @JsonKey(name: 'id_user')
  final int idUser;
  final int balance;
  final int status;
  final List<CardDTO> card;
  final UserDTO user;

  AccountDTO({
    required this.id,
    required this.idUser,
    required this.balance,
    required this.status,
    required this.card,
    required this.user,
  });

  factory AccountDTO.fromJson(Map<String, dynamic> json) => _$AccountDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDTOToJson(this);
}
