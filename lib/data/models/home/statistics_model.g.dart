// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticsModel _$StatisticsModelFromJson(Map<String, dynamic> json) =>
    StatisticsModel(
      graduates: json['graduates'] == null
          ? const Graduates()
          : Graduates.fromJson(json['graduates'] as Map<String, dynamic>),
      teachers: (json['teachers'] as num?)?.toInt() ?? 0,
      languages:
          (json['languages'] as List<dynamic>?)
              ?.map((e) => Award.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      degrees:
          (json['degrees'] as List<dynamic>?)
              ?.map((e) => Award.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      awards:
          (json['awards'] as List<dynamic>?)
              ?.map((e) => Award.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$StatisticsModelToJson(StatisticsModel instance) =>
    <String, dynamic>{
      'graduates': instance.graduates,
      'teachers': instance.teachers,
      'languages': instance.languages,
      'degrees': instance.degrees,
      'awards': instance.awards,
    };

Award _$AwardFromJson(Map<String, dynamic> json) => Award(
  title: json['title'] as String,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$AwardToJson(Award instance) => <String, dynamic>{
  'title': instance.title,
  'count': instance.count,
};

Graduates _$GraduatesFromJson(Map<String, dynamic> json) => Graduates(
  total: (json['total'] as num?)?.toInt() ?? 0,
  masters: (json['masters'] as num?)?.toInt() ?? 0,
  phd: (json['phd'] as num?)?.toInt() ?? 0,
  training: (json['training'] as num?)?.toInt() ?? 0,
  retraining: (json['retraining'] as num?)?.toInt() ?? 0,
  gender: json['gender'] == null
      ? const Gender()
      : Gender.fromJson(json['gender'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GraduatesToJson(Graduates instance) => <String, dynamic>{
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
