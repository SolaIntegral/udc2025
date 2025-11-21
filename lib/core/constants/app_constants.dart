/// アプリケーション全体で使用する定数
class AppConstants {
  AppConstants._();

  // SharedPreferences のキー
  static const String keyUserId = 'user_id';
  static const String keyUserData = 'user_data';
  static const String keyGroups = 'groups';
  static const String keyOnboardingCompleted = 'onboarding_completed';

  // Bluetooth関連
  static const String bluetoothServiceId = 'resilient-mesh-nav';
  static const int bluetoothDiscoveryTimeout = 30; // 秒

  // 地図関連
  static const double defaultLatitude = 35.6812; // 東京駅
  static const double defaultLongitude = 139.7671;
  static const double defaultZoom = 13.0;
}

