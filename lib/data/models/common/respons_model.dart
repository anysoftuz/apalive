import 'package:json_annotation/json_annotation.dart';

part 'respons_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponsModel<T> {
  @JsonKey(name: "status_code")
  final int statusCode;
  @JsonKey(name: "data")
  final T data;

  ResponsModel({required this.statusCode, required this.data});

  /// JSON dan obyektni yaratish
  factory ResponsModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fetch,
  ) => _$ResponsModelFromJson(json, fetch);

  /// JSON ga obyektni o'girish
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ResponsModelToJson(this, toJsonT);
}
