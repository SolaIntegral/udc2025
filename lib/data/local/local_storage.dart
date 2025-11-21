import 'dart:convert';
import '../../core/constants/app_constants.dart';
import '../../domain/models/user_model.dart';
import '../../domain/models/group_model.dart';
import 'shared_preferences_service.dart';

/// ローカルストレージ管理クラス
class LocalStorage {
  LocalStorage._();

  /// ユーザーIDを保存
  static Future<bool> saveUserId(String userId) async {
    return await SharedPreferencesService.setString(
      AppConstants.keyUserId,
      userId,
    );
  }

  /// ユーザーIDを取得
  static String? getUserId() {
    return SharedPreferencesService.getString(AppConstants.keyUserId);
  }

  /// ユーザーデータを保存
  static Future<bool> saveUserData(UserModel user) async {
    final json = jsonEncode(user.toJson());
    return await SharedPreferencesService.setString(
      AppConstants.keyUserData,
      json,
    );
  }

  /// ユーザーデータを取得
  static UserModel? getUserData() {
    final json = SharedPreferencesService.getString(AppConstants.keyUserData);
    if (json == null) return null;
    try {
      return UserModel.fromJson(jsonDecode(json) as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  /// グループリストを保存
  static Future<bool> saveGroups(List<GroupModel> groups) async {
    final jsonList = groups.map((g) => jsonEncode(g.toJson())).toList();
    return await SharedPreferencesService.setStringList(
      AppConstants.keyGroups,
      jsonList,
    );
  }

  /// グループリストを取得
  static List<GroupModel> getGroups() {
    final jsonList = SharedPreferencesService.getStringList(
      AppConstants.keyGroups,
    );
    if (jsonList == null) return [];
    try {
      return jsonList
          .map((json) => GroupModel.fromJson(
                jsonDecode(json) as Map<String, dynamic>,
              ))
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// オンボーディング完了フラグを保存
  static Future<bool> setOnboardingCompleted(bool completed) async {
    return await SharedPreferencesService.setBool(
      AppConstants.keyOnboardingCompleted,
      completed,
    );
  }

  /// オンボーディング完了フラグを取得
  static bool isOnboardingCompleted() {
    return SharedPreferencesService.getBool(
          AppConstants.keyOnboardingCompleted,
        ) ??
        false;
  }
}

