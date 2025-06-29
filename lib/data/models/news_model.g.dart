// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
  id: (json['id'] as num).toInt(),
  guid: json['guid'] as String,
  mainText: json['main_text'] as String,
  extraText: json['extra_text'] as String,
  file: json['file'] as String,
  createdBy: json['created_by'],
  deletedBy: json['deleted_by'],
);

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
  'id': instance.id,
  'guid': instance.guid,
  'main_text': instance.mainText,
  'extra_text': instance.extraText,
  'file': instance.file,
  'created_by': instance.createdBy,
  'deleted_by': instance.deletedBy,
};
