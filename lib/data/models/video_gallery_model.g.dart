// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoGalleryModel _$VideoGalleryModelFromJson(Map<String, dynamic> json) =>
    VideoGalleryModel(
      id: (json['id'] as num).toInt(),
      guid: json['guid'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      file: json['file'] as String,
      createdBy: json['created_by'],
      deletedBy: json['deleted_by'],
    );

Map<String, dynamic> _$VideoGalleryModelToJson(VideoGalleryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'title': instance.title,
      'description': instance.description,
      'file': instance.file,
      'created_by': instance.createdBy,
      'deleted_by': instance.deletedBy,
    };
