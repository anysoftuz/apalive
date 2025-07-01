import 'package:json_annotation/json_annotation.dart';

part 'web_socket_model.g.dart';

@JsonSerializable()
class WebSocketModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "sender_id")
  final int? senderId;

  WebSocketModel({this.message, this.senderId});

  factory WebSocketModel.fromJson(Map<String, dynamic> json) =>
      _$WebSocketModelFromJson(json);

  Map<String, dynamic> toJson() => _$WebSocketModelToJson(this);
}
