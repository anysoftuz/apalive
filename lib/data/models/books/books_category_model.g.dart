// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksCategoryModel _$BooksCategoryModelFromJson(Map<String, dynamic> json) =>
    BooksCategoryModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      categoryId: (json['category_id'] as num).toInt(),
    );

Map<String, dynamic> _$BooksCategoryModelToJson(BooksCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category_id': instance.categoryId,
    };
