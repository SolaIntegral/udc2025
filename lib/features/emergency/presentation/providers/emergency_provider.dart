import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../domain/models/emergency_status_model.dart';

part 'emergency_provider.g.dart';

/// 安否ステータスプロバイダー
@riverpod
class EmergencyStatus extends _$EmergencyStatus {
  @override
  EmergencyStatusModel? build() {
    return null;
  }

  /// 安否ステータスを更新
  void updateStatus(EmergencyStatusModel status) {
    state = status;
  }

  /// ステータスをクリア
  void clear() {
    state = null;
  }
}

