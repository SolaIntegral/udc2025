import 'package:flutter/material.dart';
import '../../../../core/widgets/user_avatar_icon.dart';

/// メッセージバブル
/// チャット会話画面でメッセージを表示するバブルコンポーネント
class MessageBubble extends StatelessWidget {
  final String message;
  final bool isFromMe;
  final String? senderName;
  final DateTime? timestamp;
  final UserAvatarType? avatarType;

  const MessageBubble({
    super.key,
    required this.message,
    this.isFromMe = false,
    this.senderName,
    this.timestamp,
    this.avatarType,
  });

  @override
  Widget build(BuildContext context) {
    if (isFromMe) {
      // 自分のメッセージ（右側）
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF2F3244),
                height: 1.4,
              ),
            ),
          ),
        ),
      );
    } else {
      // 相手のメッセージ（左側）
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // アバター
            if (avatarType != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: UserAvatarIcon(
                  type: avatarType!,
                  size: 36,
                ),
              ),
            // メッセージ内容
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 送信者名（オプション）
                  if (senderName != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        senderName!,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8A8A8A),
                        ),
                      ),
                    ),
                  // メッセージバブル
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2F3244),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

