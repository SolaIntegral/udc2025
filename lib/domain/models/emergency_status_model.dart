import 'package:freezed_annotation/freezed_annotation.dart';

part 'emergency_status_model.freezed.dart';
part 'emergency_status_model.g.dart';

/// 安否ステータス種別
/// NOTE: Keep enum values stable because they may be persisted.
enum EmergencyStatusType {
  safe,
  injured,
  needHelp,
  sos,
}

/// 安否ステータスモデル
@freezed
class EmergencyStatusModel with _$EmergencyStatusModel {
  const factory EmergencyStatusModel({
    required String userId,
    required EmergencyStatusType status,
    String? message,
    required DateTime timestamp,
  }) = _EmergencyStatusModel;

  factory EmergencyStatusModel.fromJson(Map<String, dynamic> json) =>
      _$EmergencyStatusModelFromJson(json);
}
