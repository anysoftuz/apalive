import 'package:json_annotation/json_annotation.dart';

part 'content_model.g.dart';

@JsonSerializable()
class ContentModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "guid")
  final String guid;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "file")
  final String file;
  @JsonKey(name: "created_by")
  final String createdBy;
  @JsonKey(name: "deleted_by")
  final String deletedBy;

  ContentModel({
    this.id = 0,
    this.guid = '',
    this.title = '',
    this.description = '',
    this.file = '',
    this.createdBy = '',
    this.deletedBy = '',
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContentModelToJson(this);
}
