import 'package:flutter/material.dart';
import '../../../../domain/models/chat_message_model.dart';

/// 地域掲示板（ブロードキャスト）画面
class ChatBroadcastPage extends StatefulWidget {
  const ChatBroadcastPage({super.key});

  @override
  State<ChatBroadcastPage> createState() => _ChatBroadcastPageState();
}

class _ChatBroadcastPageState extends State<ChatBroadcastPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessageModel> _broadcasts = [];

  @override
  void initState() {
    super.initState();
    _loadMockBroadcasts();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _loadMockBroadcasts() {
    // TODO: 実際のブロードキャスト取得に置き換え
    setState(() {
      _broadcasts.addAll([
        ChatMessageModel(
          id: 'broadcast1',
          senderId: 'user1',
          senderName: '田中 太郎',
          content: 'あそこの道が通れません。別のルートを使ってください。',
          type: ChatMessageType.broadcast,
          timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
          originalLanguage: 'ja',
        ),
        ChatMessageModel(
          id: 'broadcast2',
          senderId: 'user2',
          senderName: 'John Smith',
          content: 'Water is available at the community center.',
          type: ChatMessageType.broadcast,
          timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
          originalLanguage: 'en',
          translatedContent: '水はコミュニティセンターで入手できます。',
        ),
        ChatMessageModel(
          id: 'broadcast3',
          senderId: 'user3',
          senderName: '李 明',
          content: '这里有一个临时避难所',
          type: ChatMessageType.broadcast,
          timestamp: DateTime.now().subtract(const Duration(hours: 1)),
          originalLanguage: 'zh',
          translatedContent: 'ここに一時避難所があります',
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 注意書き
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.orange.shade50,
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.orange),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'このエリアにいる全員に情報が送信されます。デマに注意してください。',
                    style: TextStyle(fontSize: 12, color: Colors.orange.shade900),
                  ),
                ),
              ],
            ),
          ),
          // ブロードキャストリスト
          Expanded(
            child: _broadcasts.isEmpty
                ? const Center(
                    child: Text('掲示板にメッセージがありません'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: _broadcasts.length,
                    itemBuilder: (context, index) {
                      return _buildBroadcastCard(_broadcasts[index]);
                    },
                  ),
          ),
          // メッセージ送信欄
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: '地域への情報を入力...',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.send),
                      color: Colors.green,
                      onPressed: _sendBroadcast,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  '※このメッセージは周辺の全員に送信されます',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBroadcastCard(ChatMessageModel broadcast) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  child: Text(broadcast.senderName[0]),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        broadcast.senderName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '${broadcast.timestamp.hour}:${broadcast.timestamp.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '地域',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.orange.shade900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(broadcast.content),
            if (broadcast.translatedContent != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.translate, size: 16, color: Colors.blue),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        broadcast.translatedContent!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _sendBroadcast() {
    if (_messageController.text.trim().isEmpty) return;

    final broadcast = ChatMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: 'current_user',
      senderName: '私',
      content: _messageController.text.trim(),
      type: ChatMessageType.broadcast,
      timestamp: DateTime.now(),
      originalLanguage: 'ja',
    );

    setState(() {
      _broadcasts.insert(0, broadcast);
    });

    _messageController.clear();
  }
}

