import 'package:flutter/material.dart';
import '../../../../domain/models/user_model.dart';
import '../../../../domain/models/group_model.dart';
import '../../../../data/repositories/group_repository.dart';

/// グループ安否確認画面
/// 事前に登録した信頼できるメンバーの安否を確認
class SafetyPage extends StatefulWidget {
  const SafetyPage({super.key});

  @override
  State<SafetyPage> createState() => _SafetyPageState();
}

class _SafetyPageState extends State<SafetyPage> {
  final _groupRepository = GroupRepository();
  List<GroupModel> _groups = [];
  Map<String, List<UserModel>> _groupMembers = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadGroups();
  }

  Future<void> _loadGroups() async {
    setState(() => _isLoading = true);
    try {
      final groups = await _groupRepository.getAllGroups();
      setState(() {
        _groups = groups;
        // TODO: 実際のユーザーデータ取得に置き換え
        _groupMembers = _generateMockMembers(groups);
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Map<String, List<UserModel>> _generateMockMembers(List<GroupModel> groups) {
    final members = <String, List<UserModel>>{};
    for (final group in groups) {
      members[group.id] = group.memberIds.map((id) {
        return UserModel(
          id: id,
          name: id == 'user1' ? '田中 太郎' : id == 'user5' ? '山田 花子' : 'メンバー $id',
          language: 'ja',
          status: id == 'user1' ? UserStatus.ok : UserStatus.unknown,
          batteryLevel: id == 'user1' ? 85 : 60,
          lastSeenAt: DateTime.now().subtract(Duration(minutes: int.parse(id.replaceAll('user', '')) * 5)),
        );
      }).toList();
    }
    return members;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('グループ安否確認'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadGroups,
            tooltip: '更新',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _groups.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.group_outlined, size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      const Text(
                        'グループがありません',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          // TODO: グループ作成ページへ遷移
                        },
                        icon: const Icon(Icons.group_add),
                        label: const Text('グループを作成'),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    // ワンタップ報告ボタン
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.purple.shade50,
                      child: Column(
                        children: [
                          const Text(
                            '自分の状態を報告',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () => _reportStatus(UserStatus.ok),
                                  icon: const Icon(Icons.check_circle),
                                  label: const Text('無事です'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () => _reportStatus(UserStatus.sos),
                                  icon: const Icon(Icons.warning),
                                  label: const Text('助けが必要'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // グループリスト
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: _groups.length,
                        itemBuilder: (context, index) {
                          return _buildGroupCard(_groups[index]);
                        },
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget _buildGroupCard(GroupModel group) {
    final members = _groupMembers[group.id] ?? [];
    final safeCount = members.where((m) => m.status == UserStatus.ok).length;
    final sosCount = members.where((m) => m.status == UserStatus.sos).length;
    final unknownCount = members.where((m) => m.status == UserStatus.unknown).length;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ExpansionTile(
        leading: const Icon(Icons.group, color: Colors.purple),
        title: Text(group.name),
        subtitle: Text('${members.length}人'),
        children: [
          // ステータスサマリー
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatusIndicator('無事', safeCount, Colors.green),
                _buildStatusIndicator('SOS', sosCount, Colors.red),
                _buildStatusIndicator('不明', unknownCount, Colors.grey),
              ],
            ),
          ),
          // メンバーリスト
          ...members.map((member) => _buildMemberTile(member)),
        ],
      ),
    );
  }

  Widget _buildStatusIndicator(String label, int count, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Text(
            '$count',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: color),
        ),
      ],
    );
  }

  Widget _buildMemberTile(UserModel member) {
    final statusColor = member.status == UserStatus.sos
        ? Colors.red
        : member.status == UserStatus.ok
            ? Colors.green
            : Colors.grey;
    final statusIcon = member.status == UserStatus.sos
        ? Icons.warning
        : member.status == UserStatus.ok
            ? Icons.check_circle
            : Icons.help_outline;

    return ListTile(
      leading: CircleAvatar(
        child: Text(member.name[0]),
      ),
      title: Text(member.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(statusIcon, size: 16, color: statusColor),
              const SizedBox(width: 4),
              Text(
                member.status == UserStatus.sos
                    ? 'SOS'
                    : member.status == UserStatus.ok
                        ? '無事'
                        : '不明',
                style: TextStyle(color: statusColor, fontSize: 12),
              ),
            ],
          ),
          if (member.lastSeenAt != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.access_time, size: 12, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  '${_getTimeAgo(member.lastSeenAt!)}前',
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ],
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.battery_std,
                size: 16,
                color: member.batteryLevel < 20 ? Colors.red : Colors.grey,
              ),
              const SizedBox(width: 4),
              Text(
                '${member.batteryLevel}%',
                style: TextStyle(
                  fontSize: 12,
                  color: member.batteryLevel < 20 ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return '1分未満';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}分';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}時間';
    } else {
      return '${difference.inDays}日';
    }
  }

  void _reportStatus(UserStatus status) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(status == UserStatus.ok ? '無事を報告' : 'SOSを発信'),
        content: Text(
          status == UserStatus.ok
              ? 'グループメンバーに「無事です」と報告しますか？'
              : 'グループメンバーに「助けが必要」と報告しますか？',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('キャンセル'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: 実際のステータス更新処理
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    status == UserStatus.ok
                        ? '無事を報告しました'
                        : 'SOSを発信しました',
                  ),
                ),
              );
              _loadGroups();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: status == UserStatus.ok ? Colors.green : Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('報告'),
          ),
        ],
      ),
    );
  }
}

