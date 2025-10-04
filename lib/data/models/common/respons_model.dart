import 'package:json_annotation/json_annotation.dart';

part 'respons_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponsModel<T> {
  @JsonKey(name: "status_code")
  final int? statusCode;
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "next")
  final String? next;
  @JsonKey(name: "previous")
  final String? previous;
  @JsonKey(name: "data")
  final T data;

  ResponsModel({
    this.statusCode,
    this.count,
    this.next,
    this.previous,
    required this.data,
  });

  /// JSON dan obyektni yaratish
  factory ResponsModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fetch,
  ) => _$ResponsModelFromJson(json, fetch);

  /// JSON ga obyektni o'girish
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ResponsModelToJson(this, toJsonT);
}
