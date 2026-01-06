import 'package:flutter/material.dart';

/// コミュニケーション通知カードのタイプ
enum CommNotificationType {
  warning, // 警告（黄色の！アイコン）
  success, // 成功（緑のチェックマーク）
  danger, // 危険（赤いXアイコン）
}

/// コミュニケーション通知カード
/// ホーム画面（情報画面）でコミュニケーション関連の通知を表示するカード
class CommNotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final CommNotificationType? type; // カードのタイプ
  final VoidCallback? onTap;

  const CommNotificationCard({
    super.key,
    required this.title,
    required this.description,
    this.type,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final notificationType = type ?? _inferTypeFromTitle(title);
    final backgroundColor = _getBackgroundColor(notificationType);

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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              children: [
                // アイコンエリア
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(13),
                  child: _buildIcon(notificationType),
                ),
                const SizedBox(width: 21),
                // テキスト情報
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2F3244),
                          letterSpacing: -0.24,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        description,
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
                const SizedBox(width: 30),
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

  /// タイトルからタイプを推測
  CommNotificationType _inferTypeFromTitle(String title) {
    if (title.contains('警報') || title.contains('要避難') || title.contains('危険')) {
      return CommNotificationType.danger;
    } else if (title.contains('情報なし') || title.contains('なし')) {
      return CommNotificationType.success;
    }
    return CommNotificationType.warning; // デフォルト
  }

  /// タイプに応じた背景色を取得
  Color _getBackgroundColor(CommNotificationType type) {
    switch (type) {
      case CommNotificationType.warning:
        return const Color(0xFFFFF2D2); // 黄色背景
      case CommNotificationType.success:
        return const Color(0xFFEDFFE5); // 緑背景
      case CommNotificationType.danger:
        return const Color(0xFFFFD2D3); // ピンク背景
    }
  }

  /// タイプに応じたアイコンデータを取得（後でSVGに置き換え可能）
  IconData? _getIconData(CommNotificationType type) {
    switch (type) {
      case CommNotificationType.warning:
        return Icons.warning;
      case CommNotificationType.success:
        return Icons.check_circle;
      case CommNotificationType.danger:
        return Icons.close;
    }
  }

  /// アイコンを構築
  Widget _buildIcon(CommNotificationType type) {
    final iconData = _getIconData(type);
    Color iconColor;
    
    switch (type) {
      case CommNotificationType.warning:
        iconColor = const Color(0xFFFFB02E); // オレンジ
        break;
      case CommNotificationType.success:
        iconColor = const Color(0xFF00D26A); // 緑
        break;
      case CommNotificationType.danger:
        iconColor = const Color(0xFFF92F60); // ピンク/赤
        break;
    }

    if (iconData != null) {
      return Icon(
        iconData,
        color: iconColor,
        size: 36,
      );
    }
    return const SizedBox.shrink();
  }
}

