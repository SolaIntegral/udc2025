import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferencesを使用したローカルストレージサービス
class SharedPreferencesService {
  SharedPreferencesService._();
  static SharedPreferences? _prefs;

  /// 初期化
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// インスタンス取得
  static SharedPreferences get instance {
    if (_prefs == null) {
      throw Exception('SharedPreferencesService is not initialized');
    }
    return _prefs!;
  }

  /// String値を保存
  static Future<bool> setString(String key, String value) async {
    return await instance.setString(key, value);
  }

  /// String値を取得
  static String? getString(String key) {
    return instance.getString(key);
  }

  /// Stringリストを保存
  static Future<bool> setStringList(String key, List<String> value) async {
    return await instance.setStringList(key, value);
  }

  /// Stringリストを取得
  static List<String>? getStringList(String key) {
    return instance.getStringList(key);
  }

  /// bool値を保存
  static Future<bool> setBool(String key, bool value) async {
    return await instance.setBool(key, value);
  }

  /// bool値を取得
  static bool? getBool(String key) {
    return instance.getBool(key);
  }

  /// 値を削除
  static Future<bool> remove(String key) async {
    return await instance.remove(key);
  }

  /// 全ての値をクリア
  static Future<bool> clear() async {
    return await instance.clear();
  }
}

