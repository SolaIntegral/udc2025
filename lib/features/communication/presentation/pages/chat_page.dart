import 'package:flutter/material.dart';
import '../../../../domain/models/chat_room_model.dart';
import 'chat_room_page.dart';
import 'chat_broadcast_page.dart';
import '../widgets/message_card.dart';
import '../widgets/chat_type_filter_tag.dart';

/// オフライン・チャット画面
/// 全てのチャットルームを一覧表示（フィルターで切り替え可能）
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'すべて'; // 'すべて', 'グループ', '掲示板'
  List<ChatRoomModel> _allRooms = [];
  List<ChatRoomModel> _filteredRooms = [];

  @override
  void initState() {
    super.initState();
    _loadMockRooms();
    _applyFilter();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadMockRooms() {
    // TODO: 実際のデータ取得に置き換え
    setState(() {
      _allRooms = [
        ChatRoomModel(
          id: 'room1',
          name: '田中 太郎',
          type: ChatRoomType.oneOnOne,
          memberIds: ['current_user', 'user1'],
          lastMessage: '大丈夫ですか？',
          lastMessageAt: DateTime.now().subtract(const Duration(minutes: 5)),
          unreadCount: 2,
        ),
        ChatRoomModel(
          id: 'room2',
          name: 'John Smith',
          type: ChatRoomType.oneOnOne,
          memberIds: ['current_user', 'user2'],
          lastMessage: 'My foot is trapped under the rubble, and I can\'t move. Please help me.',
          lastMessageAt: DateTime.now().subtract(const Duration(hours: 1)),
          unreadCount: 0,
        ),
        ChatRoomModel(
          id: 'group1',
          name: '田中家(3)',
          type: ChatRoomType.group,
          memberIds: ['current_user', 'user1', 'user5'],
          lastMessage: 'みんな無事か〜？\n無事なら返事時てくれ〜？',
          lastMessageAt: DateTime.now().subtract(const Duration(minutes: 10)),
          unreadCount: 1,
        ),
        ChatRoomModel(
          id: 'room3',
          name: '山田 花子',
          type: ChatRoomType.oneOnOne,
          memberIds: ['current_user', 'user3'],
          lastMessage: '保育士の資格を持っています。なにかお手伝いできることがございますか？',
          lastMessageAt: DateTime.now().subtract(const Duration(minutes: 20)),
          unreadCount: 0,
        ),
      ];
    });
    _applyFilter();
  }

  void _applyFilter() {
    setState(() {
      _filteredRooms = _allRooms.where((room) {
        // フィルター条件
        if (_selectedFilter == 'グループ') {
          if (room.type != ChatRoomType.group) return false;
        } else if (_selectedFilter == '掲示板') {
          if (room.type != ChatRoomType.broadcast) return false;
        }
        // 検索条件
        if (_searchController.text.isNotEmpty) {
          final query = _searchController.text.toLowerCase();
          if (!room.name.toLowerCase().contains(query) &&
              !(room.lastMessage?.toLowerCase().contains(query) ?? false)) {
            return false;
          }
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  const Text(
                    'チャット',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -0.24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // 検索バー
                  Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'メッセージを検索',
                        hintStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8A8A8A),
                          letterSpacing: -0.408,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 7),
                      ),
                      onChanged: (_) => _applyFilter(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // フィルタータブ
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() => _selectedFilter = 'すべて');
                          _applyFilter();
                        },
                        child: ChatTypeFilterTag(
                          label: 'すべて',
                          isSelected: _selectedFilter == 'すべて',
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          setState(() => _selectedFilter = 'グループ');
                          _applyFilter();
                        },
                        child: ChatTypeFilterTag(
                          label: 'グループ',
                          isSelected: _selectedFilter == 'グループ',
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          setState(() => _selectedFilter = '掲示板');
                          _applyFilter();
                        },
                        child: ChatTypeFilterTag(
                          label: '掲示板',
                          isSelected: _selectedFilter == '掲示板',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // チャットリスト
            Expanded(
              child: _filteredRooms.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.chat_bubble_outline, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'チャットルームがありません',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _filteredRooms.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: MessageCard(
                            room: _filteredRooms[index],
                            onTap: () {
                              if (_filteredRooms[index].type == ChatRoomType.broadcast) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatBroadcastPage(),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatRoomPage(room: _filteredRooms[index]),
                                  ),
                                );
                              }
                            },
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
}

