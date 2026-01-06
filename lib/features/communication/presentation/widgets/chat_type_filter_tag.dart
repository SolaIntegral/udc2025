import 'package:flutter/material.dart';

/// チャットタイプフィルタータグ
/// チャット画面でチャットタイプ（すべて、グループ、掲示板）のフィルターとして使用
class ChatTypeFilterTag extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const ChatTypeFilterTag({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 19.36, vertical: 7.26),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0082E1) : Colors.white,
          border: isSelected
              ? null
              : Border.all(
                  color: const Color(0xFFF2F2F2),
                  width: 1.21,
                ),
          borderRadius: BorderRadius.circular(73.81),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.1,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black,
            letterSpacing: -0.2904,
          ),
        ),
      ),
    );
  }
}

