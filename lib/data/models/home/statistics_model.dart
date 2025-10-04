import 'package:json_annotation/json_annotation.dart';

part 'statistics_model.g.dart';

@JsonSerializable()
class StatisticsModel {
  @JsonKey(name: "graduates")
  final Graduates graduates;
  @JsonKey(name: "teachers")
  final int teachers;
  @JsonKey(name: "languages")
  final List<Award> languages;
  @JsonKey(name: "degrees")
  final List<Award> degrees;
  @JsonKey(name: "awards")
  final List<Award> awards;

  const StatisticsModel({
    this.graduates = const Graduates(),
    this.teachers = 0,
    this.languages = const [],
    this.degrees = const [],
    this.awards = const [],
  });

  factory StatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticsModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsModelToJson(this);
}

@JsonSerializable()
class Award {
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "count")
  final int count;

  Award({required this.title, required this.count});

  factory Award.fromJson(Map<String, dynamic> json) => _$AwardFromJson(json);

  Map<String, dynamic> toJson() => _$AwardToJson(this);
}

@JsonSerializable()
class Graduates {
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

  const Graduates({
    this.total = 0,
    this.masters = 0,
    this.phd = 0,
    this.training = 0,
    this.retraining = 0,
    this.gender = const Gender(),
  });

  factory Graduates.fromJson(Map<String, dynamic> json) =>
      _$GraduatesFromJson(json);

  Map<String, dynamic> toJson() => _$GraduatesToJson(this);
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
