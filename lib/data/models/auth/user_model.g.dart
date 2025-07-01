// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  guid: json['guid'] as String? ?? '',
  roleName: json['role_name'] as String? ?? '',
  username: json['username'] as String? ?? '',
  name: json['name'] as String? ?? '',
  middleName: json['middle_name'] as String? ?? '',
  surname: json['surname'] as String? ?? '',
  access: json['access'] as String? ?? '',
  refresh: json['refresh'] as String? ?? '',
  photo: json['photo'] as String? ?? '',
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'guid': instance.guid,
  'role_name': instance.roleName,
  'username': instance.username,
  'name': instance.name,
  'middle_name': instance.middleName,
  'surname': instance.surname,
  'access': instance.access,
  'refresh': instance.refresh,
  'photo': instance.photo,
};
