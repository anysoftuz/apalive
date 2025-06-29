import 'package:json_annotation/json_annotation.dart';

part 'moderator_user_model.g.dart';

@JsonSerializable()
class ModeratorUserModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "guid")
  final String guid;
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "middle_name")
  final String middleName;
  @JsonKey(name: "surname")
  final String surname;
  @JsonKey(name: "passport_series")
  final String passportSeries;
  @JsonKey(name: "birth_date")
  final String birthDate;
  @JsonKey(name: "jshshir")
  final String jshshir;
  @JsonKey(name: "gender")
  final String gender;
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  @JsonKey(name: "job_title")
  final String jobTitle;
  @JsonKey(name: "linkedin_url")
  final String? linkedinUrl;
  @JsonKey(name: "instagram_url")
  final String? instagramUrl;
  @JsonKey(name: "facebook_url")
  final String? facebookUrl;
  @JsonKey(name: "created_by")
  final dynamic createdBy;
  @JsonKey(name: "deleted_by")
  final dynamic deletedBy;

  ModeratorUserModel({
    required this.id,
    required this.guid,
    required this.username,
    required this.password,
    required this.name,
    required this.middleName,
    required this.surname,
    required this.passportSeries,
    required this.birthDate,
    required this.jshshir,
    required this.gender,
    required this.phoneNumber,
    required this.jobTitle,
    required this.linkedinUrl,
    required this.instagramUrl,
    required this.facebookUrl,
    required this.createdBy,
    required this.deletedBy,
  });

  factory ModeratorUserModel.fromJson(Map<String, dynamic> json) =>
      _$ModeratorUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModeratorUserModelToJson(this);
}
