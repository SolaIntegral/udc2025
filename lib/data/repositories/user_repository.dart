import '../../domain/models/user_model.dart';
import '../local/local_storage.dart';

/// ユーザーリポジトリ
class UserRepository {
  UserRepository._();
  static final UserRepository _instance = UserRepository._();
  factory UserRepository() => _instance;

  /// 現在のユーザーを取得
  Future<UserModel?> getCurrentUser() async {
    return LocalStorage.getUserData();
  }

  /// ユーザーを保存
  Future<bool> saveUser(UserModel user) async {
    await LocalStorage.saveUserId(user.id);
    return await LocalStorage.saveUserData(user);
  }

  /// ユーザーIDを取得
  String? getUserId() {
    return LocalStorage.getUserId();
  }
}

