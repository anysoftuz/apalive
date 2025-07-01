// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_socket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebSocketModel _$WebSocketModelFromJson(Map<String, dynamic> json) =>
    WebSocketModel(
      message: json['message'] as String?,
      senderId: (json['sender_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WebSocketModelToJson(WebSocketModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'sender_id': instance.senderId,
    };
