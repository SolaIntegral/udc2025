import '../../domain/models/group_model.dart';
import '../local/local_storage.dart';

/// グループリポジトリ
class GroupRepository {
  GroupRepository._();
  static final GroupRepository _instance = GroupRepository._();
  factory GroupRepository() => _instance;

  /// 全グループを取得
  Future<List<GroupModel>> getAllGroups() async {
    return LocalStorage.getGroups();
  }

  /// グループを保存
  Future<bool> saveGroup(GroupModel group) async {
    final groups = await getAllGroups();
    final index = groups.indexWhere((g) => g.id == group.id);
    if (index >= 0) {
      groups[index] = group;
    } else {
      groups.add(group);
    }
    return await LocalStorage.saveGroups(groups);
  }

  /// グループを削除
  Future<bool> deleteGroup(String groupId) async {
    final groups = await getAllGroups();
    groups.removeWhere((g) => g.id == groupId);
    return await LocalStorage.saveGroups(groups);
  }

  /// グループにメンバーを追加
  Future<bool> addMemberToGroup(String groupId, String userId) async {
    final groups = await getAllGroups();
    final group = groups.firstWhere((g) => g.id == groupId);
    if (group.memberIds.contains(userId)) {
      return true; // 既にメンバーに含まれている
    }
    final updatedGroup = group.copyWith(
      memberIds: [...group.memberIds, userId],
    );
    return await saveGroup(updatedGroup);
  }

  /// グループからメンバーを削除
  Future<bool> removeMemberFromGroup(String groupId, String userId) async {
    final groups = await getAllGroups();
    final group = groups.firstWhere((g) => g.id == groupId);
    final updatedMemberIds = group.memberIds.where((id) => id != userId).toList();
    final updatedGroup = group.copyWith(memberIds: updatedMemberIds);
    return await saveGroup(updatedGroup);
  }
}

