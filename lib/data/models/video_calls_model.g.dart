// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_calls_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCallsModel _$VideoCallsModelFromJson(Map<String, dynamic> json) =>
    VideoCallsModel(
      id: (json['id'] as num).toInt(),
      guid: json['guid'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      startTime: json['start_time'] as String,
      participants:
          (json['participants'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
      roomName: json['room_name'] as String,
      videoUrl: json['video_url'] as String,
      createdBy: json['created_by'],
      deletedBy: json['deleted_by'],
    );

Map<String, dynamic> _$VideoCallsModelToJson(VideoCallsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'title': instance.title,
      'date': instance.date,
      'start_time': instance.startTime,
      'participants': instance.participants,
      'room_name': instance.roomName,
      'video_url': instance.videoUrl,
      'created_by': instance.createdBy,
      'deleted_by': instance.deletedBy,
    };
