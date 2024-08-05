import 'package:json_annotation/json_annotation.dart';

part 'postTransferDTO.g.dart';

@JsonSerializable()

class PostTransferDTO {
  @JsonKey(name: 'user_account')
  final String userAccount;

  @JsonKey(name: 'receptor_account')
  final String receptorAccount;

  final int amount;
  final String concept;
  final String owner;

  PostTransferDTO({
    required this.userAccount,
    required this.receptorAccount,
    required this.amount,
    required this.concept,
    required this.owner,
  });

     factory PostTransferDTO.fromJson(Map<String, dynamic> json) => _$PostTransferDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PostTransferDTOToJson(this);

  static List<PostTransferDTO> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => PostTransferDTO.fromJson(json as Map<String, dynamic>)).toList();
  }

}



