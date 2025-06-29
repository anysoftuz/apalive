import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "guid")
  final String guid;
  @JsonKey(name: "main_text")
  final String mainText;
  @JsonKey(name: "extra_text")
  final String extraText;
  @JsonKey(name: "file")
  final String file;
  @JsonKey(name: "created_by")
  final dynamic createdBy;
  @JsonKey(name: "deleted_by")
  final dynamic deletedBy;

  NewsModel({
    required this.id,
    required this.guid,
    required this.mainText,
    required this.extraText,
    required this.file,
    required this.createdBy,
    required this.deletedBy,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
