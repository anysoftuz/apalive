import 'package:json_annotation/json_annotation.dart';

part 'chat_message_model.g.dart';

@JsonSerializable()
class ChatMessageModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "guid")
  final String guid;
  @JsonKey(name: "sender")
  final Recipient sender;
  @JsonKey(name: "recipient")
  final Recipient recipient;
  @JsonKey(name: "group")
  final dynamic group;
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "created_by")
  final dynamic createdBy;
  @JsonKey(name: "deleted_by")
  final dynamic deletedBy;

  ChatMessageModel({
    required this.id,
    required this.guid,
    required this.sender,
    required this.recipient,
    required this.group,
    required this.message,
    required this.createdBy,
    required this.deletedBy,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);
}

@JsonSerializable()
class Recipient {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "guid")
  final String guid;
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "surname")
  final String surname;
  @JsonKey(name: "middle_name")
  final String middleName;

  Recipient({
    required this.id,
    required this.guid,
    required this.username,
    required this.name,
    required this.surname,
    required this.middleName,
  });

  factory Recipient.fromJson(Map<String, dynamic> json) =>
      _$RecipientFromJson(json);

  Map<String, dynamic> toJson() => _$RecipientToJson(this);
}
