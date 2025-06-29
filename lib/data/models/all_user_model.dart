import 'package:json_annotation/json_annotation.dart';

part 'all_user_model.g.dart';

@JsonSerializable()
class AllUserModel {
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
  @JsonKey(name: "photo")
  final String photo;
  @JsonKey(name: "role")
  final String role;
  @JsonKey(name: "full_name")
  final String fullName;

  AllUserModel({
    required this.id,
    required this.guid,
    required this.username,
    required this.name,
    required this.surname,
    this.photo = '',
    required this.role,
    required this.fullName,
  });

  factory AllUserModel.fromJson(Map<String, dynamic> json) =>
      _$AllUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllUserModelToJson(this);
}
