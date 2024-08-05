import 'package:json_annotation/json_annotation.dart';

part 'postContactDTO.g.dart';

@JsonSerializable()
class PostContactDTO {
  String nickname;
  String email;
  String phone;
  String bankname;
  String account;

  PostContactDTO({
    required this.nickname,
    required this.email,
    required this.phone,
    required this.bankname,
    required this.account,
  });

  factory PostContactDTO.fromJson(Map<String, dynamic> json) => _$PostContactDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PostContactDTOToJson(this);
}
