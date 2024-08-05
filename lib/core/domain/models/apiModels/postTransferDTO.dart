import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class PostTransferDTO {
  @JsonKey(name: 'user_account')
   String userAccount;

  @JsonKey(name: 'receptor_account')
   String receptorAccount;

   int amount;
   String concept;
   String owner;

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



PostTransferDTO _$PostTransferDTOFromJson(Map<String, dynamic> json) =>
    PostTransferDTO(
      userAccount: json['user_account'] as String,
      receptorAccount: json['receptor_account'] as String,
      amount: (json['amount'] as num).toInt(),
      concept: json['concept'] as String,
      owner: json['owner'] as String,
    );

Map<String, dynamic> _$PostTransferDTOToJson(PostTransferDTO instance) =>
    <String, dynamic>{
      'user_account': instance.userAccount,
      'receptor_account': instance.receptorAccount,
      'amount': instance.amount,
      'concept': instance.concept,
      'owner': instance.owner,
    };

