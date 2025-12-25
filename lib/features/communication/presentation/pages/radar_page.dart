import 'package:flutter/material.dart';
import '../../../../domain/models/nearby_user_model.dart';
import '../../../../domain/models/user_model.dart';
import '../widgets/user_card.dart';
import '../../../../core/widgets/language_filter_tag.dart';

/// 周辺ユーザー探索・レーダー画面
/// 近くにいる「助け合える人」を探すためのメイン画面
class RadarPage extends StatefulWidget {
  const RadarPage({super.key});

  @override
  State<RadarPage> createState() => _RadarPageState();
}

class _RadarPageState extends State<RadarPage> {
  List<NearbyUserModel> _nearbyUsers = [];
  String? _selectedLanguage;

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
          language: 'en',
          nationality: 'JP',
          status: UserStatus.ok,
          batteryLevel: 85,
          skills: ['力仕事', '英語'],
          latitude: 35.6812,
          longitude: 139.7671,
          lastSeenAt: DateTime.now().subtract(const Duration(minutes: 2)),
        ),
        distance: 26,
        discoveredAt: DateTime.now(),
        isTrustedGroupMember: true,
      ),
      NearbyUserModel(
        user: UserModel(
          id: 'user3',
          name: '李 明',
          language: 'zh',
          nationality: 'CN',
          status: UserStatus.ok,
          batteryLevel: 85,
          skills: ['応急処置', '英語'],
          latitude: 35.6800,
          longitude: 139.7660,
          lastSeenAt: DateTime.now().subtract(const Duration(minutes: 1)),
        ),
        distance: 26,
        discoveredAt: DateTime.now(),
        isTrustedGroupMember: false,
      ),
      NearbyUserModel(
        user: UserModel(
          id: 'user2',
          name: 'John Smith',
          language: 'en',
          nationality: 'US',
          status: UserStatus.ok,
          batteryLevel: 85,
          skills: ['力仕事', '英語', 'スペイン語'],
          latitude: 35.6820,
          longitude: 139.7680,
          lastSeenAt: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
        distance: 26,
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
          batteryLevel: 85,
          skills: ['子連れサポート'],
          needs: ['妊娠中'],
          latitude: 35.6815,
          longitude: 139.7675,
          lastSeenAt: DateTime.now().subtract(const Duration(minutes: 4)),
        ),
        distance: 26,
        discoveredAt: DateTime.now(),
        isTrustedGroupMember: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final filteredUsers = _getFilteredUsers();

    return Scaffold(
      backgroundColor: const Color(0xFFFDFEFF), // Figmaデザインの背景色
      body: SafeArea(
        child: Column(
          children: [
            // ヘッダー部分
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32), // ステータスバーとタイトル間のスペース
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'コミュニティ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.24,
                        ),
                      ),
                      Container(
                        width: 111,
                        height: 13,
                        color: const Color(0xFFF7F7F7), // プレースホルダーの色
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // 言語フィルター
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() => _selectedLanguage = null);
                          },
                          child: LanguageFilterTag(
                            label: 'すべて',
                            isSelected: _selectedLanguage == null,
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() => _selectedLanguage = 'ja');
                          },
                          child: LanguageFilterTag(
                            label: '日本語',
                            isSelected: _selectedLanguage == 'ja',
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() => _selectedLanguage = 'en');
                          },
                          child: LanguageFilterTag(
                            label: '英語',
                            isSelected: _selectedLanguage == 'en',
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() => _selectedLanguage = 'zh');
                          },
                          child: LanguageFilterTag(
                            label: '中国語',
                            isSelected: _selectedLanguage == 'zh',
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() => _selectedLanguage = 'ko');
                          },
                          child: LanguageFilterTag(
                            label: '韓国語',
                            isSelected: _selectedLanguage == 'ko',
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() => _selectedLanguage = 'es');
                          },
                          child: LanguageFilterTag(
                            label: 'スペイン語',
                            isSelected: _selectedLanguage == 'es',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // ユーザーリスト
            Expanded(
              child: filteredUsers.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.people_outline, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            '周辺にユーザーが見つかりませんでした',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: filteredUsers.length,
                      itemBuilder: (context, index) {
                        final nearbyUser = filteredUsers[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: UserCard(
                            user: nearbyUser.user,
                            distance: nearbyUser.distance,
                            onTap: () => _showUserDetail(nearbyUser),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  List<NearbyUserModel> _getFilteredUsers() {
    var users = _nearbyUsers;
    if (_selectedLanguage != null) {
      users = users.where((u) => u.user.language == _selectedLanguage).toList();
    }
    return users;
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

