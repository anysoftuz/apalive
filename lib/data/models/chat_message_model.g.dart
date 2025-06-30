// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      id: (json['id'] as num).toInt(),
      guid: json['guid'] as String,
      sender: Recipient.fromJson(json['sender'] as Map<String, dynamic>),
      recipient:
          json['recipient'] == null
              ? null
              : Recipient.fromJson(json['recipient'] as Map<String, dynamic>),
      group: json['group'],
      message: json['message'] as String,
      createdBy: json['created_by'],
      deletedBy: json['deleted_by'],
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'sender': instance.sender,
      'recipient': instance.recipient,
      'group': instance.group,
      'message': instance.message,
      'created_by': instance.createdBy,
      'deleted_by': instance.deletedBy,
    };

Recipient _$RecipientFromJson(Map<String, dynamic> json) => Recipient(
  id: (json['id'] as num).toInt(),
  guid: json['guid'] as String,
  username: json['username'] as String,
  name: json['name'] as String,
  surname: json['surname'] as String,
  middleName: json['middle_name'] as String,
);

Map<String, dynamic> _$RecipientToJson(Recipient instance) => <String, dynamic>{
  'id': instance.id,
  'guid': instance.guid,
  'username': instance.username,
  'name': instance.name,
  'surname': instance.surname,
  'middle_name': instance.middleName,
};
