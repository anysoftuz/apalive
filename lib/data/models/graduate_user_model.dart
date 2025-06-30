import 'package:json_annotation/json_annotation.dart';

part 'graduate_user_model.g.dart';

@JsonSerializable()
class GraduateUserModel {
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
  @JsonKey(name: "known_languages")
  final List<AcademicDegree> knownLanguages;
  @JsonKey(name: "state_awards")
  final List<AcademicDegree> stateAwards;
  @JsonKey(name: "academic_degree")
  final List<AcademicDegree> academicDegree;
  @JsonKey(name: "character_traits")
  final List<AcademicDegree> characterTraits;
  @JsonKey(name: "created_by")
  final dynamic createdBy;
  @JsonKey(name: "deleted_by")
  final dynamic deletedBy;
  @JsonKey(name: "photo")
  final String photo;

  GraduateUserModel({
    this.id = 0,
    this.guid = '',
    this.username = '',
    this.password = '',
    this.name = '',
    this.middleName = '',
    this.surname = '',
    this.passportSeries = '',
    this.birthDate = '',
    this.jshshir = '',
    this.gender = '',
    this.phoneNumber = '',
    this.photo = '',
    this.knownLanguages = const [],
    this.stateAwards = const [],
    this.academicDegree = const [],
    this.characterTraits = const [],
    this.createdBy,
    this.deletedBy,
  });

  factory GraduateUserModel.fromJson(Map<String, dynamic> json) =>
      _$GraduateUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$GraduateUserModelToJson(this);
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
