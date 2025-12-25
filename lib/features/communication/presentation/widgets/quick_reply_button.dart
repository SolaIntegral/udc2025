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
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(40),
        ),
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
    );
  }
}

