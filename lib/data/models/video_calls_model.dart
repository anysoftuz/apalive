import 'package:json_annotation/json_annotation.dart';

part 'video_calls_model.g.dart';

@JsonSerializable()
class VideoCallsModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "guid")
  final String guid;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "date")
  final String date;
  @JsonKey(name: "start_time")
  final String startTime;
  @JsonKey(name: "participants")
  final List<int> participants;
  @JsonKey(name: "room_name")
  final String roomName;
  @JsonKey(name: "video_url")
  final String videoUrl;
  @JsonKey(name: "created_by")
  final dynamic createdBy;
  @JsonKey(name: "deleted_by")
  final dynamic deletedBy;

  VideoCallsModel({
    required this.id,
    required this.guid,
    required this.title,
    required this.date,
    required this.startTime,
    required this.participants,
    required this.roomName,
    required this.videoUrl,
    required this.createdBy,
    required this.deletedBy,
  });

  factory VideoCallsModel.fromJson(Map<String, dynamic> json) =>
      _$VideoCallsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoCallsModelToJson(this);
}
