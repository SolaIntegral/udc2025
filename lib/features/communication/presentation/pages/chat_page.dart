import 'package:flutter/material.dart';
import '../../../../domain/models/chat_room_model.dart';
import 'chat_room_page.dart';
import 'chat_broadcast_page.dart';

/// オフライン・チャット画面
/// 1対1/グループ/掲示板をタブで切り替え
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チャット'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: '1対1'),
            Tab(text: 'グループ'),
            Tab(text: '掲示板'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _OneOnOneChatTab(),
          _GroupChatTab(),
          ChatBroadcastPage(),
        ],
      ),
    );
  }
}

/// 1対1チャットタブ
class _OneOnOneChatTab extends StatefulWidget {
  const _OneOnOneChatTab();

  @override
  State<_OneOnOneChatTab> createState() => _OneOnOneChatTabState();
}

class _OneOnOneChatTabState extends State<_OneOnOneChatTab> {
  List<ChatRoomModel> _rooms = [];

  @override
  void initState() {
    super.initState();
    _loadMockRooms();
  }

  void _loadMockRooms() {
    // TODO: 実際のデータ取得に置き換え
    setState(() {
      _rooms = [
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
          lastMessage: 'I need help',
          lastMessageAt: DateTime.now().subtract(const Duration(hours: 1)),
          unreadCount: 0,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return _rooms.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.chat_bubble_outline, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                const Text(
                  'チャットルームがありません',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: _rooms.length,
            itemBuilder: (context, index) {
              return _buildRoomCard(_rooms[index]);
            },
          );
  }

  Widget _buildRoomCard(ChatRoomModel room) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(room.name[0]),
        ),
        title: Text(room.name),
        subtitle: Text(
          room.lastMessage ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: room.unreadCount > 0
            ? Badge(
                label: Text('${room.unreadCount}'),
                child: const Icon(Icons.chat_bubble),
              )
            : null,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatRoomPage(room: room),
            ),
          );
        },
      ),
    );
  }
}

/// グループチャットタブ
class _GroupChatTab extends StatefulWidget {
  const _GroupChatTab();

  @override
  State<_GroupChatTab> createState() => _GroupChatTabState();
}

class _GroupChatTabState extends State<_GroupChatTab> {
  List<ChatRoomModel> _groupRooms = [];

  @override
  void initState() {
    super.initState();
    _loadMockGroupRooms();
  }

  void _loadMockGroupRooms() {
    // TODO: 実際のデータ取得に置き換え
    setState(() {
      _groupRooms = [
        ChatRoomModel(
          id: 'group1',
          name: '家族グループ',
          type: ChatRoomType.group,
          memberIds: ['current_user', 'user1', 'user5'],
          lastMessage: '全員無事です',
          lastMessageAt: DateTime.now().subtract(const Duration(minutes: 10)),
          unreadCount: 1,
        ),
        ChatRoomModel(
          id: 'group2',
          name: '避難所メンバー',
          type: ChatRoomType.group,
          memberIds: ['current_user', 'user1', 'user2', 'user3'],
          lastMessage: '水が配られました',
          lastMessageAt: DateTime.now().subtract(const Duration(hours: 2)),
          unreadCount: 0,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              // TODO: グループ作成
            },
            icon: const Icon(Icons.group_add),
            label: const Text('新しいグループを作成'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: _groupRooms.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.group_outlined, size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      const Text(
                        'グループチャットがありません',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: _groupRooms.length,
                  itemBuilder: (context, index) {
                    return _buildGroupRoomCard(_groupRooms[index]);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildGroupRoomCard(ChatRoomModel room) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green.shade100,
          child: const Icon(Icons.group, color: Colors.green),
        ),
        title: Text(room.name),
        subtitle: Text(
          '${room.memberIds.length}人 • ${room.lastMessage ?? ''}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: room.unreadCount > 0
            ? Badge(
                label: Text('${room.unreadCount}'),
                child: const Icon(Icons.chat_bubble),
              )
            : null,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatRoomPage(room: room),
            ),
          );
        },
      ),
    );
  }
}

