// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmergencyStatusModelImpl _$$EmergencyStatusModelImplFromJson(
  Map<String, dynamic> json,
) => _$EmergencyStatusModelImpl(
  userId: json['userId'] as String,
  status: $enumDecode(_$EmergencyStatusTypeEnumMap, json['status']),
  message: json['message'] as String?,
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$$EmergencyStatusModelImplToJson(
  _$EmergencyStatusModelImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'status': _$EmergencyStatusTypeEnumMap[instance.status]!,
  'message': instance.message,
  'timestamp': instance.timestamp.toIso8601String(),
};

const _$EmergencyStatusTypeEnumMap = {
  EmergencyStatusType.safe: 'safe',
  EmergencyStatusType.injured: 'injured',
  EmergencyStatusType.needHelp: 'needHelp',
  EmergencyStatusType.sos: 'sos',
};
