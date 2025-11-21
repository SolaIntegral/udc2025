import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../domain/models/group_model.dart';
import '../../../../data/repositories/group_repository.dart';

part 'group_provider.g.dart';

/// グループリポジトリプロバイダー
@riverpod
GroupRepository groupRepository(GroupRepositoryRef ref) {
  return GroupRepository();
}

/// グループ一覧プロバイダー
@riverpod
Future<List<GroupModel>> groupList(GroupListRef ref) async {
  final repository = ref.watch(groupRepositoryProvider);
  return await repository.getAllGroups();
}

/// グループプロバイダー
@riverpod
Future<GroupModel?> group(GroupRef ref, String groupId) async {
  final groups = await ref.watch(groupListProvider.future);
  try {
    return groups.firstWhere((g) => g.id == groupId);
  } catch (e) {
    return null;
  }
}

