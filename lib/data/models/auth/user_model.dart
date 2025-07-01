import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "guid")
  final String guid;
  @JsonKey(name: "role_name")
  final String roleName;
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "middle_name")
  final String middleName;
  @JsonKey(name: "surname")
  final String surname;
  @JsonKey(name: "access")
  final String access;
  @JsonKey(name: "refresh")
  final String refresh;
  @JsonKey(name: "photo")
  final String photo;

  const UserModel({
    this.id = 0,
    this.guid = '',
    this.roleName = '',
    this.username = '',
    this.name = '',
    this.middleName = '',
    this.surname = '',
    this.access = '',
    this.refresh = '',
    this.photo = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
