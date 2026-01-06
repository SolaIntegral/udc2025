import 'package:flutter/material.dart';

/// 情報カラムカード
/// ホーム画面（情報画面）で情報カテゴリを表示するカード
class InfoColumnCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget? image;
  final double? imageHeight; // 画像の高さ（Figmaデザインに合わせて調整可能）
  final VoidCallback? onTap;

  const InfoColumnCard({
    super.key,
    required this.title,
    required this.description,
    this.image,
    this.imageHeight,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // タイトルに基づいて画像の高さを決定（Figmaデザインに合わせる）
    final height = imageHeight ?? _getDefaultImageHeight(title);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 165,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // 画像エリア
              Container(
                height: height,
                width: 165,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: image ??
                    const Center(
                      child: Icon(
                        Icons.image,
                        color: Colors.grey,
                        size: 32,
                      ),
                    ),
              ),
              // テキスト情報
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4C5066),
                        letterSpacing: -0.24,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4C5066),
                        height: 1.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// タイトルに基づいてデフォルトの画像の高さを取得
  double _getDefaultImageHeight(String title) {
    if (title.contains('女性')) {
      return 101; // バリアント2: 101px
    }
    return 97; // デフォルト・バリアント3: 97px
  }
}

