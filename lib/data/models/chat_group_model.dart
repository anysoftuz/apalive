import 'package:json_annotation/json_annotation.dart';

part 'chat_group_model.g.dart';

@JsonSerializable()
class ChatGroupModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "guid")
  final String guid;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "logo")
  final String logo;
  @JsonKey(name: "created_by")
  final CreatedBy? createdBy;
  @JsonKey(name: "deleted_by")
  final dynamic deletedBy;

  ChatGroupModel({
    required this.id,
    required this.guid,
    required this.name,
    required this.logo,
    this.createdBy,
    this.deletedBy,
  });

  factory ChatGroupModel.fromJson(Map<String, dynamic> json) =>
      _$ChatGroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGroupModelToJson(this);
}

@JsonSerializable()
class CreatedBy {
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

  CreatedBy({
    required this.id,
    required this.guid,
    required this.username,
    required this.name,
    required this.surname,
    required this.middleName,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}
