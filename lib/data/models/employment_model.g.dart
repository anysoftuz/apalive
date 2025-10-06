// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmploymentModel _$EmploymentModelFromJson(Map<String, dynamic> json) =>
    EmploymentModel(
      employerName: json['employer_name'] as String,
      employerInn: json['employer_inn'] as String,
      position: json['position'] as String,
      status: json['status'] as String,
      hiredAt: json['hired_at'] as String,
      firedAt: json['fired_at'] as String?,
      contractType: json['contract_type'] as String?,
      department: json['department'] as String?,
      payload: Payload.fromJson(json['payload'] as Map<String, dynamic>),
      fetchedAt: json['fetchedAt'] as String,
      source: json['source'] as String,
    );

Map<String, dynamic> _$EmploymentModelToJson(EmploymentModel instance) =>
    <String, dynamic>{
      'employer_name': instance.employerName,
      'employer_inn': instance.employerInn,
      'position': instance.position,
      'status': instance.status,
      'hired_at': instance.hiredAt,
      'fired_at': instance.firedAt,
      'contract_type': instance.contractType,
      'department': instance.department,
      'payload': instance.payload,
      'fetchedAt': instance.fetchedAt,
      'source': instance.source,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) => Payload(
  actionTypeId: (json['action_type_id'] as num?)?.toInt(),
  companyInn: json['company_inn'] as String,
  companyName: json['company_name'] as String,
  contractDate: json['contract_date'] == null
      ? null
      : DateTime.parse(json['contract_date'] as String),
  contractNumber: json['contract_number'] as String?,
  endDate: json['end_date'] == null
      ? null
      : DateTime.parse(json['end_date'] as String),
  kodp: json['kodp'] as String?,
  kodpType: json['kodp_type'] as String?,
  markConfirmation: (json['mark_confirmation'] as num).toInt(),
  orderDate: DateTime.parse(json['order_date'] as String),
  orderNumber: json['order_number'] as String,
  parentId: (json['parent_id'] as num?)?.toInt(),
  personPin: json['person_pin'] as String,
  positionId: (json['position_id'] as num?)?.toInt(),
  positionName: json['position_name'] as String,
  soatoCode: json['soato_code'] as String,
  startDate: DateTime.parse(json['start_date'] as String),
  structureName: json['structure_name'] as String?,
  transactionId: (json['transaction_id'] as num).toInt(),
  workType: (json['work_type'] as num).toInt(),
  workplaceAddress: json['workplace_address'] as String?,
);

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
  'action_type_id': instance.actionTypeId,
  'company_inn': instance.companyInn,
  'company_name': instance.companyName,
  'contract_date': instance.contractDate?.toIso8601String(),
  'contract_number': instance.contractNumber,
  'end_date': instance.endDate?.toIso8601String(),
  'kodp': instance.kodp,
  'kodp_type': instance.kodpType,
  'mark_confirmation': instance.markConfirmation,
  'order_date': instance.orderDate.toIso8601String(),
  'order_number': instance.orderNumber,
  'parent_id': instance.parentId,
  'person_pin': instance.personPin,
  'position_id': instance.positionId,
  'position_name': instance.positionName,
  'soato_code': instance.soatoCode,
  'start_date': instance.startDate.toIso8601String(),
  'structure_name': instance.structureName,
  'transaction_id': instance.transactionId,
  'work_type': instance.workType,
  'workplace_address': instance.workplaceAddress,
};
