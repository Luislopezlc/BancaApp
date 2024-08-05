import 'package:json_annotation/json_annotation.dart';

part 'contactDTO.g.dart';

@JsonSerializable()
class ContactDTO {
  final int id;
  @JsonKey(name: 'id_user')
  final int idUser;
  final String nickname;
  final String email;
  final String phone;
  final String bankname;
  final String account;

  ContactDTO({
    required this.id,
    required this.idUser,
    required this.nickname,
    required this.email,
    required this.phone,
    required this.bankname,
    required this.account,
  });

  // Factory constructor for creating a new ContactDTO instance from a map
  factory ContactDTO.fromJson(Map<String, dynamic> json) => _$ContactDTOFromJson(json);

  // Method for converting a ContactDTO instance to a map
  Map<String, dynamic> toJson() => _$ContactDTOToJson(this);

  static List<ContactDTO> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => ContactDTO.fromJson(json as Map<String, dynamic>)).toList();
  }
}
