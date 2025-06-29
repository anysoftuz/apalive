// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forums_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumsModel _$ForumsModelFromJson(Map<String, dynamic> json) => ForumsModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  guid: json['guid'] as String? ?? '',
  title: json['title'] as String? ?? '',
  content: json['content'] as String? ?? '',
  users: json['users'] as List<dynamic>? ?? const [],
  file: json['file'] as String? ?? '',
  createdBy: json['created_by'] as String? ?? '',
  deletedBy: json['deleted_by'] as String? ?? '',
);

Map<String, dynamic> _$ForumsModelToJson(ForumsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'title': instance.title,
      'content': instance.content,
      'users': instance.users,
      'file': instance.file,
      'created_by': instance.createdBy,
      'deleted_by': instance.deletedBy,
    };
