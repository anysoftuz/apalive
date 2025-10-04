import 'package:json_annotation/json_annotation.dart';

part 'books_category_model.g.dart';

@JsonSerializable()
class BooksCategoryModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "category_id")
  final int categoryId;

  BooksCategoryModel({
    required this.id,
    required this.name,
    required this.categoryId,
  });

  factory BooksCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$BooksCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$BooksCategoryModelToJson(this);
}
