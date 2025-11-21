import 'package:freezed_annotation/freezed_annotation.dart';

part 'emergency_status_model.freezed.dart';
part 'emergency_status_model.g.dart';

/// 安否ステータスの種類
enum EmergencyStatusType {
  safe, // 無事
  injured, // 怪我
  needHelp, // 支援が必要
  sos, // SOS
}

/// 安否ステータスモデル
@freezed
class EmergencyStatusModel with _$EmergencyStatusModel {
  const factory EmergencyStatusModel({
    required String userId,
    required EmergencyStatusType status,
    String? message,
    double? latitude, // 位置情報（緯度）
    double? longitude, // 位置情報（経度）
    DateTime? timestamp,
  }) = _EmergencyStatusModel;

  factory EmergencyStatusModel.fromJson(Map<String, dynamic> json) =>
      _$EmergencyStatusModelFromJson(json);
}

