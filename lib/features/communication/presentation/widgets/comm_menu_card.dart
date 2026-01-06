import 'package:flutter/material.dart';

/// コミュニケーションメニューカード
/// コミュニケーション画面で機能メニューを表示するカード
class CommMenuCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget? iconWidget; // SVGアイコン用のウィジェット
  final IconData? icon; // 従来のアイコンデータ（後方互換性のため）
  final Color? iconColor;
  final Color? iconBackgroundColor; // アイコンエリアの背景色
  final VoidCallback? onTap;

  const CommMenuCard({
    super.key,
    required this.title,
    required this.description,
    this.iconWidget,
    this.icon,
    this.iconColor,
    this.iconBackgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // タイトルに基づいて背景色を決定（Figmaデザインに合わせる）
    final bgColor = iconBackgroundColor ?? _getDefaultBackgroundColor(title);

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
                    color: bgColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(13),
                  child: iconWidget ??
                      (icon != null
                          ? Icon(
                              icon,
                              color: iconColor ?? Colors.grey,
                              size: 32,
                            )
                          : null),
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

  /// タイトルに基づいてデフォルトの背景色を取得
  Color _getDefaultBackgroundColor(String title) {
    if (title.contains('周辺ユーザー') || title.contains('検索')) {
      return const Color(0xFFFFF0F0); // オレンジ系
    } else if (title.contains('グループ') || title.contains('安否')) {
      return const Color(0xFFF0F4FF); // 青系
    } else if (title.contains('プロフィール') || title.contains('支援')) {
      return const Color(0xFFFBF0FF); // 紫系
    } else if (title.contains('つながり')) {
      return const Color(0xFFFBFFF0); // 黄緑系
    }
    return const Color(0xFFF5F5F5); // デフォルト
  }
}

