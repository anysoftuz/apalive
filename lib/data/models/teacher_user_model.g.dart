// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherUserModel _$TeacherUserModelFromJson(Map<String, dynamic> json) =>
    TeacherUserModel(
      id: (json['id'] as num).toInt(),
      guid: json['guid'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      photo: json['photo'],
      name: json['name'] as String,
      middleName: json['middle_name'] as String,
      surname: json['surname'] as String,
      academicDegree: (json['academic_degree'] as List<dynamic>)
          .map((e) => AcademicDegree.fromJson(e as Map<String, dynamic>))
          .toList(),
      characterTraits: (json['character_traits'] as List<dynamic>)
          .map((e) => AcademicDegree.fromJson(e as Map<String, dynamic>))
          .toList(),
      passportSeries: json['passport_series'] as String,
      birthDate: json['birth_date'] as String,
      jshshir: json['jshshir'] as String,
      gender: json['gender'] as String,
      phoneNumber: json['phone_number'] as String,
      jobTitle: json['job_title'] as String,
      workExperience: json['work_experience'] as String,
      email: json['email'] as String,
      createdBy: json['created_by'],
      deletedBy: json['deleted_by'],
    );

Map<String, dynamic> _$TeacherUserModelToJson(TeacherUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'username': instance.username,
      'password': instance.password,
      'photo': instance.photo,
      'name': instance.name,
      'middle_name': instance.middleName,
      'surname': instance.surname,
      'academic_degree': instance.academicDegree,
      'character_traits': instance.characterTraits,
      'passport_series': instance.passportSeries,
      'birth_date': instance.birthDate,
      'jshshir': instance.jshshir,
      'gender': instance.gender,
      'phone_number': instance.phoneNumber,
      'job_title': instance.jobTitle,
      'work_experience': instance.workExperience,
      'email': instance.email,
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
