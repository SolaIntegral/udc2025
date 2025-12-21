import 'package:flutter/material.dart';
import '../../../../domain/models/nearby_user_model.dart';
import '../../../../domain/models/user_model.dart';

/// 周辺ユーザー探索・レーダー画面
/// 近くにいる「助け合える人」を探すためのメイン画面
class RadarPage extends StatefulWidget {
  const RadarPage({super.key});

  @override
  State<RadarPage> createState() => _RadarPageState();
}

class _RadarPageState extends State<RadarPage> {
  bool _isSearching = false;
  List<NearbyUserModel> _nearbyUsers = [];
  String? _selectedLanguage;
  bool _showOnlyTrusted = false;

  @override
  void initState() {
    super.initState();
    _loadMockData();
  }

  /// モックデータを読み込む
  void _loadMockData() {
    // TODO: 実際のBluetooth検索に置き換え
    setState(() {
      _nearbyUsers = _generateMockUsers();
    });
  }

  /// モックユーザーデータを生成
  List<NearbyUserModel> _generateMockUsers() {
    return [
      NearbyUserModel(
        user: UserModel(
          id: 'user1',
          name: '田中 太郎',
          language: 'ja',
          nationality: 'JP',
          status: UserStatus.ok,
          batteryLevel: 85,
          skills: ['力仕事ができます', '日本語と英語が話せます'],
          latitude: 35.6812,
          longitude: 139.7671,
          lastSeenAt: DateTime.now().subtract(const Duration(minutes: 2)),
        ),
        distance: 25.5,
        discoveredAt: DateTime.now(),
        isTrustedGroupMember: true,
      ),
      NearbyUserModel(
        user: UserModel(
          id: 'user2',
          name: 'John Smith',
          language: 'en',
          nationality: 'US',
          status: UserStatus.ok,
          batteryLevel: 60,
          skills: ['応急処置ができます', '英語とスペイン語が話せます'],
          latitude: 35.6820,
          longitude: 139.7680,
          lastSeenAt: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
        distance: 45.2,
        discoveredAt: DateTime.now(),
        isTrustedGroupMember: false,
      ),
      NearbyUserModel(
        user: UserModel(
          id: 'user3',
          name: '李 明',
          language: 'zh',
          nationality: 'CN',
          status: UserStatus.sos,
          batteryLevel: 20,
          needs: ['怪我をしています'],
          latitude: 35.6800,
          longitude: 139.7660,
          lastSeenAt: DateTime.now().subtract(const Duration(minutes: 1)),
        ),
        distance: 80.5,
        discoveredAt: DateTime.now(),
        isTrustedGroupMember: false,
      ),
      NearbyUserModel(
        user: UserModel(
          id: 'user4',
          name: 'Maria Garcia',
          language: 'es',
          nationality: 'ES',
          status: UserStatus.ok,
          batteryLevel: 90,
          skills: ['医療従事者です', 'スペイン語と英語が話せます'],
          religiousConsiderations: 'ハラール対応可能',
          latitude: 35.6830,
          longitude: 139.7690,
          lastSeenAt: DateTime.now().subtract(const Duration(minutes: 3)),
        ),
        distance: 120.3,
        discoveredAt: DateTime.now(),
        isTrustedGroupMember: false,
      ),
      NearbyUserModel(
        user: UserModel(
          id: 'user5',
          name: '山田 花子',
          language: 'ja',
          nationality: 'JP',
          status: UserStatus.ok,
          batteryLevel: 75,
          skills: ['子連れのサポートができます'],
          needs: ['妊娠中'],
          latitude: 35.6815,
          longitude: 139.7675,
          lastSeenAt: DateTime.now().subtract(const Duration(minutes: 4)),
        ),
        distance: 35.8,
        discoveredAt: DateTime.now(),
        isTrustedGroupMember: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final filteredUsers = _getFilteredUsers();

    return Scaffold(
      appBar: AppBar(
        title: const Text('周辺ユーザー探索'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.stop : Icons.refresh),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });
              if (_isSearching) {
                _startSearch();
              }
            },
            tooltip: _isSearching ? '検索停止' : '再検索',
          ),
        ],
      ),
      body: Column(
        children: [
          // フィルタリングバー
          Container(
            padding: const EdgeInsets.all(12.0),
            color: Colors.grey.shade100,
            child: Column(
              children: [
                // 言語フィルター
                Row(
                  children: [
                    const Text('言語: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Wrap(
                        spacing: 8,
                        children: [
                          _buildFilterChip('全て', null, _selectedLanguage, (value) {
                            setState(() => _selectedLanguage = value);
                          }),
                          _buildFilterChip('日本語', 'ja', _selectedLanguage, (value) {
                            setState(() => _selectedLanguage = value);
                          }),
                          _buildFilterChip('英語', 'en', _selectedLanguage, (value) {
                            setState(() => _selectedLanguage = value);
                          }),
                          _buildFilterChip('中国語', 'zh', _selectedLanguage, (value) {
                            setState(() => _selectedLanguage = value);
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // 信頼グループのみ表示
                Row(
                  children: [
                    Checkbox(
                      value: _showOnlyTrusted,
                      onChanged: (value) {
                        setState(() => _showOnlyTrusted = value ?? false);
                      },
                    ),
                    const Text('信頼グループのみ表示'),
                  ],
                ),
              ],
            ),
          ),

          // ユーザーリスト
          Expanded(
            child: _isSearching
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('周辺を検索中...'),
                      ],
                    ),
                  )
                : filteredUsers.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.people_outline, size: 64, color: Colors.grey),
                            const SizedBox(height: 16),
                            const Text(
                              '周辺にユーザーが見つかりませんでした',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          return _buildUserCard(filteredUsers[index]);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  List<NearbyUserModel> _getFilteredUsers() {
    var users = _nearbyUsers;
    if (_selectedLanguage != null) {
      users = users.where((u) => u.user.language == _selectedLanguage).toList();
    }
    if (_showOnlyTrusted) {
      users = users.where((u) => u.isTrustedGroupMember).toList();
    }
    return users;
  }

  Widget _buildFilterChip(
    String label,
    String? value,
    String? selectedValue,
    ValueChanged<String?> onSelected,
  ) {
    final isSelected = value == selectedValue;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        onSelected(selected ? value : null);
      },
    );
  }

  Widget _buildUserCard(NearbyUserModel nearbyUser) {
    final user = nearbyUser.user;
    final statusColor = user.status == UserStatus.sos ? Colors.red : Colors.green;
    final statusText = user.status == UserStatus.sos ? 'SOS' : 'OK';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: InkWell(
        onTap: () {
          _showUserDetail(nearbyUser);
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // ステータスインジケーター
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              // 属性アイコン
              Column(
                children: [
                  _buildLanguageIcon(user.language),
                  if (nearbyUser.isTrustedGroupMember)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.verified,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              // ユーザー情報
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            statusText,
                            style: TextStyle(
                              color: statusColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          '${nearbyUser.distance.toStringAsFixed(0)}m',
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(width: 12),
                        Icon(Icons.battery_std, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          '${user.batteryLevel}%',
                          style: TextStyle(
                            fontSize: 12,
                            color: user.batteryLevel < 20 ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    if (user.skills != null && user.skills!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Wrap(
                        spacing: 4,
                        children: user.skills!.take(2).map((skill) {
                          return Chip(
                            label: Text(
                              skill,
                              style: const TextStyle(fontSize: 10),
                            ),
                            padding: EdgeInsets.zero,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageIcon(String language) {
    // 言語に応じた国旗アイコン（簡易版）
    final iconData = {
      'ja': Icons.flag,
      'en': Icons.flag_outlined,
      'zh': Icons.flag_outlined,
      'es': Icons.flag_outlined,
    }[language] ?? Icons.language;

    return Icon(iconData, size: 24);
  }

  void _startSearch() {
    // TODO: 実際のBluetooth検索を実装
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isSearching = false;
          _loadMockData();
        });
      }
    });
  }

  void _showUserDetail(NearbyUserModel nearbyUser) {
    final user = nearbyUser.user;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Text(user.name[0]),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (user.nationality != null)
                              Text(
                                '国籍: ${user.nationality}',
                                style: const TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildDetailRow('距離', '${nearbyUser.distance.toStringAsFixed(0)}m'),
                  _buildDetailRow('ステータス', user.status == UserStatus.sos ? 'SOS' : 'OK'),
                  _buildDetailRow('バッテリー', '${user.batteryLevel}%'),
                  if (user.skills != null && user.skills!.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    const Text(
                      'できること',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: user.skills!.map((skill) {
                        return Chip(label: Text(skill));
                      }).toList(),
                    ),
                  ],
                  if (user.needs != null && user.needs!.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    const Text(
                      '支援が必要',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: user.needs!.map((need) {
                        return Chip(
                          label: Text(need),
                          backgroundColor: Colors.red.shade100,
                        );
                      }).toList(),
                    ),
                  ],
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        // TODO: チャット画面へ遷移
                      },
                      icon: const Icon(Icons.chat),
                      label: const Text('メッセージを送る'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

