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
      // 自分のメッセージ（右側、青背景）
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.66,
            ),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF0082E1), // 青背景
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF2B3452).withOpacity(0.03),
                  offset: const Offset(0, 0),
                  blurRadius: 29.8,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.33,
              ),
            ),
          ),
        ),
      );
    } else {
      // 相手のメッセージ（左側、白背景）
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // アバター（41px、ステータスインジケーター付き）
            if (avatarType != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: UserAvatarIcon(
                  type: avatarType!,
                  size: 41,
                  showStatusIndicator: true,
                  statusIndicator: _getStatusIndicator(senderName),
                ),
              ),
            // メッセージ内容
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 送信者名（12px）
                  if (senderName != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        senderName!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2F3244),
                          letterSpacing: -0.24,
                        ),
                      ),
                    ),
                  // メッセージバブル
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.66,
                    ),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF2B3452).withOpacity(0.03),
                          offset: const Offset(0, 0),
                          blurRadius: 29.8,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF566977),
                        height: 1.33,
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

  UserStatusIndicator? _getStatusIndicator(String? senderName) {
    // 送信者名に基づいてステータスインジケーターを決定
    if (senderName == null) return null;
    if (senderName.contains('田中 太郎')) {
      return UserStatusIndicator.online; // 緑
    } else if (senderName.contains('田中真弓')) {
      return UserStatusIndicator.sos; // 赤
    }
    return UserStatusIndicator.online;
  }
}

