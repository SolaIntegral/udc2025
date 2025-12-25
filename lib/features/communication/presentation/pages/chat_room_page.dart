import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../domain/models/chat_room_model.dart';
import '../../../../domain/models/chat_message_model.dart';
import '../../../../core/widgets/user_avatar_icon.dart';
import '../widgets/message_bubble.dart';
import '../widgets/quick_reply_button.dart';

// Figmaの画像アセットURLを定数として定義
const String imgSend = "http://localhost:3845/assets/5d6b60bb22e7e3030fcff2d21cf804edc2b94b68.svg";

/// チャットルーム画面（1対1/グループ）
/// Figmaデザインに基づいた会話画面
class ChatRoomPage extends StatefulWidget {
  final ChatRoomModel room;

  const ChatRoomPage({super.key, required this.room});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessageModel> _messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadMockMessages();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMockMessages() {
    // TODO: 実際のメッセージ取得に置き換え
    setState(() {
      _messages.addAll([
        ChatMessageModel(
          id: 'msg1',
          senderId: 'user1',
          senderName: '田中 太郎',
          content: 'こんにちは、大丈夫ですか？',
          type: ChatMessageType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
          roomId: widget.room.id,
          isRead: true,
        ),
        ChatMessageModel(
          id: 'msg2',
          senderId: 'current_user',
          senderName: '私',
          content: 'はい、無事です。ありがとうございます。',
          type: ChatMessageType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 9)),
          roomId: widget.room.id,
          isRead: true,
        ),
        ChatMessageModel(
          id: 'msg3',
          senderId: 'user1',
          senderName: '田中 太郎',
          content: '良かったです。何か必要なものがあれば教えてください。',
          type: ChatMessageType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 8)),
          roomId: widget.room.id,
          isRead: true,
        ),
      ]);
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
            Container(
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
                  // 相手の名前・グループ名
                  Center(
                    child: Text(
                      widget.room.name,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        letterSpacing: -0.24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // メッセージリスト
            Expanded(
              child: _messages.isEmpty
                  ? const Center(
                      child: Text(
                        'メッセージがありません',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        final isMe = message.senderId == 'current_user';
                        return MessageBubble(
                          message: message.content,
                          isFromMe: isMe,
                          senderName: isMe ? null : message.senderName,
                          timestamp: message.timestamp,
                          avatarType: isMe
                              ? null
                              : _getAvatarTypeForSender(message.senderId),
                        );
                      },
                    ),
            ),
            // クイックリプライボタン
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 0, 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x5656771A).withOpacity(0.1),
                    offset: const Offset(0, -7),
                    blurRadius: 6.6,
                  ),
                ],
              ),
              child: Row(
                children: [
                  QuickReplyButton(
                    text: '承知しました！👍',
                    onTap: () => _sendQuickReply('承知しました！👍'),
                  ),
                  const SizedBox(width: 10),
                  QuickReplyButton(
                    text: 'ありがとうございます😊',
                    onTap: () => _sendQuickReply('ありがとうございます😊'),
                  ),
                  const SizedBox(width: 10),
                  QuickReplyButton(
                    text: 'よろしくお願いします',
                    onTap: () => _sendQuickReply('よろしくお願いします'),
                  ),
                ],
              ),
            ),
            // メッセージ入力欄
            Container(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x5656771A).withOpacity(0.1),
                    offset: const Offset(0, -7),
                    blurRadius: 6.6,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFD8D8D8)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: 'メッセージを入力してください',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8A8A8A),
                            letterSpacing: -0.408,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 7,
                          ),
                        ),
                        maxLines: null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 9),
                  // 送信ボタン
                  GestureDetector(
                    onTap: _sendMessage,
                    child: Container(
                      width: 49,
                      height: 36,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0082E1), // ACCカラー
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.network(
                        imgSend,
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  UserAvatarType? _getAvatarTypeForSender(String senderId) {
    // 送信者IDに基づいてアバタータイプを決定
    // TODO: 実際のユーザー情報から取得
    switch (senderId) {
      case 'user1':
        return UserAvatarType.defaultCat;
      case 'user2':
        return UserAvatarType.alien;
      case 'user3':
        return UserAvatarType.robot;
      default:
        return UserAvatarType.defaultCat;
    }
  }

  void _sendQuickReply(String text) {
    _messageController.text = text;
    _sendMessage();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final message = ChatMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: 'current_user',
      senderName: '私',
      content: _messageController.text.trim(),
      type: ChatMessageType.text,
      timestamp: DateTime.now(),
      roomId: widget.room.id,
      isRead: false,
    );

    setState(() {
      _messages.add(message);
    });

    _messageController.clear();
    // スクロールを最下部に移動
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}

