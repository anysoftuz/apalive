// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionStatisticsModel _$RegionStatisticsModelFromJson(
  Map<String, dynamic> json,
) => RegionStatisticsModel(
  region: json['region'] as String? ?? '',
  statistics: json['statistics'] == null
      ? const Statistics()
      : Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegionStatisticsModelToJson(
  RegionStatisticsModel instance,
) => <String, dynamic>{
  'region': instance.region,
  'statistics': instance.statistics,
};

Statistics _$StatisticsFromJson(Map<String, dynamic> json) => Statistics(
  total: (json['total'] as num?)?.toInt() ?? 0,
  masters: (json['masters'] as num?)?.toInt() ?? 0,
  phd: (json['phd'] as num?)?.toInt() ?? 0,
  training: (json['training'] as num?)?.toInt() ?? 0,
  retraining: (json['retraining'] as num?)?.toInt() ?? 0,
  gender: json['gender'] == null
      ? const Gender()
      : Gender.fromJson(json['gender'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StatisticsToJson(Statistics instance) =>
    <String, dynamic>{
      'total': instance.total,
      'masters': instance.masters,
      'phd': instance.phd,
      'training': instance.training,
      'retraining': instance.retraining,
      'gender': instance.gender,
    };

Gender _$GenderFromJson(Map<String, dynamic> json) => Gender(
  male: (json['male'] as num?)?.toInt() ?? 0,
  female: (json['female'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$GenderToJson(Gender instance) => <String, dynamic>{
  'male': instance.male,
  'female': instance.female,
};
