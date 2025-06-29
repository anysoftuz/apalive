// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsModel<T> _$ResponsModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ResponsModel<T>(
  statusCode: (json['status_code'] as num).toInt(),
  data: fromJsonT(json['data']),
);

Map<String, dynamic> _$ResponsModelToJson<T>(
  ResponsModel<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'status_code': instance.statusCode,
  'data': toJsonT(instance.data),
};
