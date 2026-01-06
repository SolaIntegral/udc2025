import 'package:flutter/material.dart';
import '../../../../domain/models/chat_room_model.dart';
import '../../../../core/widgets/user_avatar_icon.dart';

/// メッセージカード
/// チャット画面でチャットルームを表示するカード
class MessageCard extends StatelessWidget {
  final ChatRoomModel room;
  final VoidCallback? onTap;

  const MessageCard({
    super.key,
    required this.room,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF2B3452).withOpacity(0.03),
              offset: const Offset(0, 0),
              blurRadius: 29.8,
              spreadRadius: 10,
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // アイコン（未読数がある場合はバッジを表示）
                Stack(
                  children: [
                    UserAvatarIcon(
                      type: _getAvatarType(room),
                      size: 58,
                    ),
                    if (room.unreadCount > 0)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF8312F), // 赤いバッジ（Figmaデザイン）
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 21),
                // メッセージ情報
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        room.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2F3244),
                          letterSpacing: -0.24,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        room.lastMessage ?? '',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2F3244),
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 21),
                // 右矢印アイコン
                const Icon(
                  Icons.chevron_right,
                  size: 16,
                  color: Color(0xFF838383),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  UserAvatarType _getAvatarType(ChatRoomModel room) {
    // チャットルーム名に基づいてアイコンを決定（Figmaデザインに合わせる）
    if (room.name.contains('田中 太郎')) {
      return UserAvatarType.robot; // ロボット（バリアント12）
    } else if (room.name.contains('John Smith')) {
      return UserAvatarType.alien; // エイリアン（バリアント8）
    } else if (room.name.contains('田中家')) {
      return UserAvatarType.defaultCat; // デフォルト（猫）
    } else if (room.name.contains('山田')) {
      return UserAvatarType.defaultCat; // デフォルト（猫）
    }
    
    // デフォルト：チャットルームのタイプに応じてアイコンを決定
    switch (room.type) {
      case ChatRoomType.oneOnOne:
        return UserAvatarType.defaultCat;
      case ChatRoomType.group:
        return UserAvatarType.alien;
      case ChatRoomType.broadcast:
        return UserAvatarType.robot;
    }
  }
}

