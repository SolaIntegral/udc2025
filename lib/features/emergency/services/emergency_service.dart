import '../../../../domain/models/emergency_status_model.dart';
import '../../offline_comm/services/bluetooth_mesh_service.dart';
import '../../../../data/repositories/group_repository.dart';

/// 緊急時サービス
class EmergencyService {
  EmergencyService._();
  static final EmergencyService _instance = EmergencyService._();
  factory EmergencyService() => _instance;

  final _bluetoothService = BluetoothMeshService();
  final _groupRepository = GroupRepository();

  /// 安否ステータスを送信
  Future<bool> sendEmergencyStatus(EmergencyStatusModel status) async {
    // 信頼できるグループメンバーに送信
    final groups = await _groupRepository.getAllGroups();
    final trustedMemberIds = <String>{};
    for (final group in groups) {
      trustedMemberIds.addAll(group.memberIds);
    }

    // Bluetoothで周辺デバイスを検索
    final nearbyDevices = await _bluetoothService.startDiscovery();

    // 信頼できるメンバーと照合して送信
    bool sent = false;
    for (final deviceId in nearbyDevices) {
      // TODO: デバイスIDからユーザーIDを取得するロジックが必要
      // 簡易版として、デバイスIDをそのまま使用
      if (trustedMemberIds.contains(deviceId)) {
        final message = status.toJson();
        await _bluetoothService.sendMessage(deviceId, message);
        sent = true;
      }
    }

    return sent;
  }

  /// SOSを発信
  Future<bool> sendSos(String userId) async {
    final status = EmergencyStatusModel(
      userId: userId,
      status: EmergencyStatusType.sos,
      timestamp: DateTime.now(),
    );
    return await sendEmergencyStatus(status);
  }
}

