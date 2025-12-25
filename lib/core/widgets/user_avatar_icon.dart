import 'package:flutter/material.dart';

/// ユーザーアバターアイコン
/// ユーザーカードやプロフィールで使用するアイコンコンポーネント
class UserAvatarIcon extends StatelessWidget {
  final UserAvatarType type;
  final double size;
  final bool showStatusIndicator;
  final UserStatusIndicator? statusIndicator;

  const UserAvatarIcon({
    super.key,
    this.type = UserAvatarType.defaultCat,
    this.size = 58,
    this.showStatusIndicator = false,
    this.statusIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          // メインアイコン（プレースホルダー）
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: _buildIconContent(),
          ),
          // ステータスインジケーター
          if (showStatusIndicator && statusIndicator != null)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: size * 0.2,
                height: size * 0.2,
                decoration: BoxDecoration(
                  color: _getStatusColor(statusIndicator!),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildIconContent() {
    // 実際のアイコン画像は後で実装
    // 現在はプレースホルダーとして絵文字を使用
    return Center(
      child: Text(
        _getEmojiForType(type),
        style: TextStyle(fontSize: size * 0.6),
      ),
    );
  }

  String _getEmojiForType(UserAvatarType type) {
    switch (type) {
      case UserAvatarType.defaultCat:
        return '😸';
      case UserAvatarType.alien:
        return '👽';
      case UserAvatarType.robot:
        return '🤖';
      case UserAvatarType.smallCat:
        return '😺';
      case UserAvatarType.smallAlien:
        return '👾';
      case UserAvatarType.smallRobot:
        return '🤖';
    }
  }

  Color _getStatusColor(UserStatusIndicator indicator) {
    switch (indicator) {
      case UserStatusIndicator.online:
        return Colors.green;
      case UserStatusIndicator.offline:
        return Colors.grey;
      case UserStatusIndicator.sos:
        return Colors.red;
    }
  }
}

/// ユーザーアバターの種類
enum UserAvatarType {
  defaultCat, // デフォルト（猫）
  alien, // エイリアン
  robot, // ロボット
  smallCat, // 小さい猫
  smallAlien, // 小さいエイリアン
  smallRobot, // 小さいロボット
}

/// ステータスインジケーターの種類
enum UserStatusIndicator {
  online, // オンライン
  offline, // オフライン
  sos, // SOS
}

