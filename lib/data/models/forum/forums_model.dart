import 'package:json_annotation/json_annotation.dart';

part 'forums_model.g.dart';

@JsonSerializable()
class ForumsModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "guid")
  final String guid;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "content")
  final String content;
  @JsonKey(name: "users")
  final List<dynamic> users;
  @JsonKey(name: "file")
  final String file;
  @JsonKey(name: "created_by")
  final String createdBy;
  @JsonKey(name: "deleted_by")
  final String deletedBy;

  ForumsModel({
    this.id = 0,
    this.guid = '',
    this.title = '',
    this.content = '',
    this.users = const [],
    this.file = '',
    this.createdBy = '',
    this.deletedBy = '',
  });

  factory ForumsModel.fromJson(Map<String, dynamic> json) =>
      _$ForumsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForumsModelToJson(this);
}
