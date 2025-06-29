// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderator_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModeratorUserModel _$ModeratorUserModelFromJson(Map<String, dynamic> json) =>
    ModeratorUserModel(
      id: (json['id'] as num).toInt(),
      guid: json['guid'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      middleName: json['middle_name'] as String,
      surname: json['surname'] as String,
      passportSeries: json['passport_series'] as String,
      birthDate: json['birth_date'] as String,
      jshshir: json['jshshir'] as String,
      gender: json['gender'] as String,
      phoneNumber: json['phone_number'] as String,
      jobTitle: json['job_title'] as String,
      linkedinUrl: json['linkedin_url'] as String?,
      instagramUrl: json['instagram_url'] as String?,
      facebookUrl: json['facebook_url'] as String?,
      createdBy: json['created_by'],
      deletedBy: json['deleted_by'],
    );

Map<String, dynamic> _$ModeratorUserModelToJson(ModeratorUserModel instance) =>
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
      'job_title': instance.jobTitle,
      'linkedin_url': instance.linkedinUrl,
      'instagram_url': instance.instagramUrl,
      'facebook_url': instance.facebookUrl,
      'created_by': instance.createdBy,
      'deleted_by': instance.deletedBy,
    };
