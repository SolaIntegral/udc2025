import 'package:flutter/material.dart';

/// コミュニケーションメニューカード
/// コミュニケーション画面で機能メニューを表示するカード
class CommMenuCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onTap;

  const CommMenuCard({
    super.key,
    required this.title,
    required this.description,
    this.icon,
    this.iconColor,
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
        height: 144,
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
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: icon != null
                      ? Icon(
                          icon,
                          color: iconColor ?? Colors.grey,
                          size: 32,
                        )
                      : null,
                ),
                const SizedBox(width: 21),
                // テキスト情報
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
}

