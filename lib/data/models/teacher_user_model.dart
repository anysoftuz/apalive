import 'package:json_annotation/json_annotation.dart';

part 'teacher_user_model.g.dart';

@JsonSerializable()
class TeacherUserModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "guid")
  final String guid;
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "photo")
  final dynamic photo;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "middle_name")
  final String middleName;
  @JsonKey(name: "surname")
  final String surname;
  @JsonKey(name: "academic_degree")
  final List<AcademicDegree> academicDegree;
  @JsonKey(name: "character_traits")
  final List<AcademicDegree> characterTraits;
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
  @JsonKey(name: "work_experience")
  final String workExperience;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "created_by")
  final dynamic createdBy;
  @JsonKey(name: "deleted_by")
  final dynamic deletedBy;

  TeacherUserModel({
    required this.id,
    required this.guid,
    required this.username,
    required this.password,
    required this.photo,
    required this.name,
    required this.middleName,
    required this.surname,
    required this.academicDegree,
    required this.characterTraits,
    required this.passportSeries,
    required this.birthDate,
    required this.jshshir,
    required this.gender,
    required this.phoneNumber,
    required this.jobTitle,
    required this.workExperience,
    required this.email,
    required this.createdBy,
    required this.deletedBy,
  });

  factory TeacherUserModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherUserModelToJson(this);
}

@JsonSerializable()
class AcademicDegree {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "guid")
  final String guid;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "created_by")
  final dynamic createdBy;
  @JsonKey(name: "deleted_by")
  final dynamic deletedBy;

  AcademicDegree({
    required this.id,
    required this.guid,
    required this.title,
    required this.createdBy,
    required this.deletedBy,
  });

  factory AcademicDegree.fromJson(Map<String, dynamic> json) =>
      _$AcademicDegreeFromJson(json);

  Map<String, dynamic> toJson() => _$AcademicDegreeToJson(this);
}
