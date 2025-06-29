// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllUserModel _$AllUserModelFromJson(Map<String, dynamic> json) => AllUserModel(
  id: (json['id'] as num).toInt(),
  guid: json['guid'] as String,
  username: json['username'] as String,
  name: json['name'] as String,
  surname: json['surname'] as String,
  photo: json['photo'] as String? ?? '',
  role: json['role'] as String,
  fullName: json['full_name'] as String,
);

Map<String, dynamic> _$AllUserModelToJson(AllUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'username': instance.username,
      'name': instance.name,
      'surname': instance.surname,
      'photo': instance.photo,
      'role': instance.role,
      'full_name': instance.fullName,
    };
