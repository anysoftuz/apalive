// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graduate_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GraduateUserModel _$GraduateUserModelFromJson(Map<String, dynamic> json) =>
    GraduateUserModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      guid: json['guid'] as String? ?? '',
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
      name: json['name'] as String? ?? '',
      middleName: json['middle_name'] as String? ?? '',
      surname: json['surname'] as String? ?? '',
      passportSeries: json['passport_series'] as String? ?? '',
      birthDate: json['birth_date'] as String? ?? '',
      jshshir: json['jshshir'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      knownLanguages:
          (json['known_languages'] as List<dynamic>?)
              ?.map((e) => AcademicDegree.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stateAwards:
          (json['state_awards'] as List<dynamic>?)
              ?.map((e) => AcademicDegree.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      academicDegree:
          (json['academic_degree'] as List<dynamic>?)
              ?.map((e) => AcademicDegree.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      characterTraits:
          (json['character_traits'] as List<dynamic>?)
              ?.map((e) => AcademicDegree.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdBy: json['created_by'],
      deletedBy: json['deleted_by'],
    );

Map<String, dynamic> _$GraduateUserModelToJson(GraduateUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'middle_name': instance.middleName,
      'surname': instance.surname,
      'passport_series': instance.passportSeries,
      'birth_date': instance.birthDate,
      'jshshir': instance.jshshir,
      'gender': instance.gender,
      'phone_number': instance.phoneNumber,
      'known_languages': instance.knownLanguages,
      'state_awards': instance.stateAwards,
      'academic_degree': instance.academicDegree,
      'character_traits': instance.characterTraits,
      'created_by': instance.createdBy,
      'deleted_by': instance.deletedBy,
    };

AcademicDegree _$AcademicDegreeFromJson(Map<String, dynamic> json) =>
    AcademicDegree(
      id: (json['id'] as num).toInt(),
      guid: json['guid'] as String,
      title: json['title'] as String,
      createdBy: json['created_by'],
      deletedBy: json['deleted_by'],
    );

Map<String, dynamic> _$AcademicDegreeToJson(AcademicDegree instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'title': instance.title,
      'created_by': instance.createdBy,
      'deleted_by': instance.deletedBy,
    };
