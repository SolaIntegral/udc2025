import 'package:flutter/material.dart';

/// クイックリプライボタン
/// チャット会話画面でよく使う返信を素早く送信するためのボタン
class QuickReplyButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const QuickReplyButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(text),
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF8A8A8A),
              height: 1.33,
            ),
          ),
        ),
      ),
    );
  }

  double _getHorizontalPadding(String text) {
    // テキストの長さに応じてパディングを調整（Figmaデザインに合わせて）
    if (text.contains('承知しました')) {
      return 14;
    } else if (text.contains('ありがとう')) {
      return 18;
    } else if (text.contains('よろしく')) {
      return 18;
    }
    return 18; // デフォルト
  }
}

