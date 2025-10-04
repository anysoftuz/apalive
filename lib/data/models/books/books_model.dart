import 'package:json_annotation/json_annotation.dart';

part 'books_model.g.dart';

@JsonSerializable()
class BooksModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "author")
  final String author;
  @JsonKey(name: "source")
  final String source;
  @JsonKey(name: "link")
  final String link;
  @JsonKey(name: "udk")
  final String udk;
  @JsonKey(name: "published_date")
  final String publishedDate;
  @JsonKey(name: "photo")
  final String photo;
  @JsonKey(name: "category_id")
  final int categoryId;
  @JsonKey(name: "level")
  final dynamic level;
  @JsonKey(name: "count")
  final dynamic count;
  @JsonKey(name: "created_at")
  final int createdAt;
  @JsonKey(name: "updated_at")
  final int updatedAt;
  @JsonKey(name: "created_by")
  final int createdBy;
  @JsonKey(name: "updated_by")
  final int updatedBy;
  @JsonKey(name: "category")
  final Category category;

  BooksModel({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.author,
    required this.source,
    required this.link,
    required this.udk,
    required this.publishedDate,
    required this.photo,
    required this.categoryId,
    required this.level,
    required this.count,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.category,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) =>
      _$BooksModelFromJson(json);

  Map<String, dynamic> toJson() => _$BooksModelToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "photo")
  final dynamic photo;
  @JsonKey(name: "main_category_id")
  final int mainCategoryId;
  @JsonKey(name: "created_at")
  final int createdAt;
  @JsonKey(name: "updated_at")
  final int updatedAt;
  @JsonKey(name: "created_by")
  final int createdBy;
  @JsonKey(name: "updated_by")
  final int updatedBy;

  Category({
    required this.id,
    required this.name,
    required this.photo,
    required this.mainCategoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
