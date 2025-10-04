import 'package:json_annotation/json_annotation.dart';

part 'region_statistics_model.g.dart';

@JsonSerializable()
class RegionStatisticsModel {
  @JsonKey(name: "region")
  final String region;
  @JsonKey(name: "statistics")
  final Statistics statistics;

  const RegionStatisticsModel({
    this.region = '',
    this.statistics = const Statistics(),
  });

  factory RegionStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$RegionStatisticsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegionStatisticsModelToJson(this);
}

@JsonSerializable()
class Statistics {
  @JsonKey(name: "total")
  final int total;
  @JsonKey(name: "masters")
  final int masters;
  @JsonKey(name: "phd")
  final int phd;
  @JsonKey(name: "training")
  final int training;
  @JsonKey(name: "retraining")
  final int retraining;
  @JsonKey(name: "gender")
  final Gender gender;

  const Statistics({
    this.total = 0,
    this.masters = 0,
    this.phd = 0,
    this.training = 0,
    this.retraining = 0,
    this.gender = const Gender(),
  });

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsToJson(this);
}

@JsonSerializable()
class Gender {
  @JsonKey(name: "male")
  final int male;
  @JsonKey(name: "female")
  final int female;

  const Gender({this.male = 0, this.female = 0});

  factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);

  Map<String, dynamic> toJson() => _$GenderToJson(this);
}
