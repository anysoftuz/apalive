// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatGroupModel _$ChatGroupModelFromJson(Map<String, dynamic> json) =>
    ChatGroupModel(
      id: (json['id'] as num).toInt(),
      guid: json['guid'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
      createdBy:
          json['created_by'] == null
              ? null
              : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
      deletedBy: json['deleted_by'],
    );

Map<String, dynamic> _$ChatGroupModelToJson(ChatGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'name': instance.name,
      'logo': instance.logo,
      'created_by': instance.createdBy,
      'deleted_by': instance.deletedBy,
    };

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) => CreatedBy(
  id: (json['id'] as num).toInt(),
  guid: json['guid'] as String,
  username: json['username'] as String,
  name: json['name'] as String,
  surname: json['surname'] as String,
  middleName: json['middle_name'] as String,
);

Map<String, dynamic> _$CreatedByToJson(CreatedBy instance) => <String, dynamic>{
  'id': instance.id,
  'guid': instance.guid,
  'username': instance.username,
  'name': instance.name,
  'surname': instance.surname,
  'middle_name': instance.middleName,
};
