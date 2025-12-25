import 'package:flutter/material.dart';

/// 情報カラムカード
/// ホーム画面（情報画面）で情報カテゴリを表示するカード
class InfoColumnCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget? image;
  final VoidCallback? onTap;

  const InfoColumnCard({
    super.key,
    required this.title,
    required this.description,
    this.image,
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
        width: 165,
        height: 162,
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
            children: [
              // 画像エリア
              Container(
                height: 97,
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
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2F3244),
                        letterSpacing: -0.24,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2F3244),
                        height: 1.3,
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
}

