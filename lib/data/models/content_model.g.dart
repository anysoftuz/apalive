// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentModel _$ContentModelFromJson(Map<String, dynamic> json) => ContentModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  guid: json['guid'] as String? ?? '',
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  file: json['file'] as String? ?? '',
  createdBy: json['created_by'] as String? ?? '',
  deletedBy: json['deleted_by'] as String? ?? '',
);

Map<String, dynamic> _$ContentModelToJson(ContentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'title': instance.title,
      'description': instance.description,
      'file': instance.file,
      'created_by': instance.createdBy,
      'deleted_by': instance.deletedBy,
    };
