import 'package:json_annotation/json_annotation.dart';

part 'video_gallery_model.g.dart';

@JsonSerializable()
class VideoGalleryModel {
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
  final dynamic createdBy;
  @JsonKey(name: "deleted_by")
  final dynamic deletedBy;

  VideoGalleryModel({
    required this.id,
    required this.guid,
    required this.title,
    required this.description,
    required this.file,
    required this.createdBy,
    required this.deletedBy,
  });

  factory VideoGalleryModel.fromJson(Map<String, dynamic> json) =>
      _$VideoGalleryModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoGalleryModelToJson(this);
}
