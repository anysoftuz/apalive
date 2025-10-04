// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksModel _$BooksModelFromJson(Map<String, dynamic> json) => BooksModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  type: json['type'] as String,
  author: json['author'] as String,
  source: json['source'] as String,
  link: json['link'] as String,
  udk: json['udk'] as String,
  publishedDate: json['published_date'] as String,
  photo: json['photo'] as String,
  categoryId: (json['category_id'] as num).toInt(),
  level: json['level'],
  count: json['count'],
  createdAt: (json['created_at'] as num).toInt(),
  updatedAt: (json['updated_at'] as num).toInt(),
  createdBy: (json['created_by'] as num).toInt(),
  updatedBy: (json['updated_by'] as num).toInt(),
  category: Category.fromJson(json['category'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BooksModelToJson(BooksModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'author': instance.author,
      'source': instance.source,
      'link': instance.link,
      'udk': instance.udk,
      'published_date': instance.publishedDate,
      'photo': instance.photo,
      'category_id': instance.categoryId,
      'level': instance.level,
      'count': instance.count,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'category': instance.category,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  photo: json['photo'],
  mainCategoryId: (json['main_category_id'] as num).toInt(),
  createdAt: (json['created_at'] as num).toInt(),
  updatedAt: (json['updated_at'] as num).toInt(),
  createdBy: (json['created_by'] as num).toInt(),
  updatedBy: (json['updated_by'] as num).toInt(),
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'photo': instance.photo,
  'main_category_id': instance.mainCategoryId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'created_by': instance.createdBy,
  'updated_by': instance.updatedBy,
};
