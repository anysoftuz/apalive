import 'package:json_annotation/json_annotation.dart';

part 'employment_model.g.dart';

@JsonSerializable()
class EmploymentModel {
  @JsonKey(name: "employer_name")
  final String employerName;
  @JsonKey(name: "employer_inn")
  final String employerInn;
  @JsonKey(name: "position")
  final String position;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "hired_at")
  final String hiredAt;
  @JsonKey(name: "fired_at")
  final String? firedAt;
  @JsonKey(name: "contract_type")
  final String? contractType;
  @JsonKey(name: "department")
  final String? department;
  @JsonKey(name: "payload")
  final Payload payload;
  @JsonKey(name: "fetchedAt")
  final String fetchedAt;
  @JsonKey(name: "source")
  final String source;

  EmploymentModel({
    required this.employerName,
    required this.employerInn,
    required this.position,
    required this.status,
    required this.hiredAt,
    this.firedAt,
    required this.contractType,
    required this.department,
    required this.payload,
    required this.fetchedAt,
    required this.source,
  });

  factory EmploymentModel.fromJson(Map<String, dynamic> json) =>
      _$EmploymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmploymentModelToJson(this);
}

@JsonSerializable()
class Payload {
  @JsonKey(name: "action_type_id")
  final int? actionTypeId;
  @JsonKey(name: "company_inn")
  final String companyInn;
  @JsonKey(name: "company_name")
  final String companyName;
  @JsonKey(name: "contract_date")
  final DateTime? contractDate;
  @JsonKey(name: "contract_number")
  final String? contractNumber;
  @JsonKey(name: "end_date")
  final DateTime? endDate;
  @JsonKey(name: "kodp")
  final String? kodp;
  @JsonKey(name: "kodp_type")
  final String? kodpType;
  @JsonKey(name: "mark_confirmation")
  final int markConfirmation;
  @JsonKey(name: "order_date")
  final DateTime orderDate;
  @JsonKey(name: "order_number")
  final String orderNumber;
  @JsonKey(name: "parent_id")
  final int? parentId;
  @JsonKey(name: "person_pin")
  final String personPin;
  @JsonKey(name: "position_id")
  final int? positionId;
  @JsonKey(name: "position_name")
  final String positionName;
  @JsonKey(name: "soato_code")
  final String soatoCode;
  @JsonKey(name: "start_date")
  final DateTime startDate;
  @JsonKey(name: "structure_name")
  final String? structureName;
  @JsonKey(name: "transaction_id")
  final int transactionId;
  @JsonKey(name: "work_type")
  final int workType;
  @JsonKey(name: "workplace_address")
  final String? workplaceAddress;

  Payload({
    required this.actionTypeId,
    required this.companyInn,
    required this.companyName,
    required this.contractDate,
    required this.contractNumber,
    required this.endDate,
    required this.kodp,
    required this.kodpType,
    required this.markConfirmation,
    required this.orderDate,
    required this.orderNumber,
    required this.parentId,
    required this.personPin,
    required this.positionId,
    required this.positionName,
    required this.soatoCode,
    required this.startDate,
    required this.structureName,
    required this.transactionId,
    required this.workType,
    required this.workplaceAddress,
  });

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}
