import 'package:json_annotation/json_annotation.dart';

part 'postServiceDTO.g.dart';

@JsonSerializable()
class PostServiceDTO {
  @JsonKey(name: 'id_service')
  int idService;

  @JsonKey(name: 'id_users')
  int idUsers;

  @JsonKey(name: 'id_account')
  int idAccount;

int amount;
 String reference;

  PostServiceDTO({
    required this.idService,
    required this.idUsers,
    required this.idAccount,
    required this.amount,
    required this.reference,
  });

  factory PostServiceDTO.fromJson(Map<String, dynamic> json) => _$PostServiceDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PostServiceDTOToJson(this);
}
