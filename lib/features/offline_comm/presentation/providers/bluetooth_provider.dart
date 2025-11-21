import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bluetooth_provider.g.dart';

/// Bluetooth接続状態
enum BluetoothConnectionState {
  disconnected,
  discovering,
  connecting,
  connected,
  error,
}

/// Bluetoothプロバイダー
@riverpod
class BluetoothState extends _$BluetoothState {
  @override
  BluetoothConnectionState build() {
    return BluetoothConnectionState.disconnected;
  }

  /// デバイス検索を開始
  Future<void> startDiscovery() async {
    state = BluetoothConnectionState.discovering;
    // TODO: Bluetooth検索ロジック
  }

  /// 接続を開始
  Future<void> connect(String deviceId) async {
    state = BluetoothConnectionState.connecting;
    // TODO: Bluetooth接続ロジック
  }

  /// 切断
  void disconnect() {
    state = BluetoothConnectionState.disconnected;
  }
}

