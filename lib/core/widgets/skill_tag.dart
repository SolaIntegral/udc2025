import 'package:flutter/material.dart';

/// スキル/属性タグ
/// ユーザーのスキルや属性を表示するためのタグコンポーネント
class SkillTag extends StatelessWidget {
  final String label;
  final SkillTagType? type;
  final Color? backgroundColor;
  final Color? textColor;

  const SkillTag({
    super.key,
    required this.label,
    this.type,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final (bgColor, txtColor) = _getColors();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: txtColor,
          letterSpacing: -0.24,
        ),
      ),
    );
  }

  (Color, Color) _getColors() {
    // backgroundColorとtextColorが直接指定されている場合はそれを使用
    if (backgroundColor != null && textColor != null) {
      return (backgroundColor!, textColor!);
    }
    // typeが指定されている場合はtypeから色を取得
    if (type != null) {
      return _getColorsForType(type!);
    }
    // デフォルト
    return (const Color(0xFFFFE9E9), const Color(0xFFD27979));
  }

  (Color, Color) _getColorsForType(SkillTagType type) {
    switch (type) {
      case SkillTagType.physicalWork:
        return (const Color(0xFFFFE9E9), const Color(0xFFD27979));
      case SkillTagType.english:
        return (const Color(0xFFE9F5FF), const Color(0xFF7B9BCE));
      case SkillTagType.spanish:
        return (const Color(0xFFFFFBE9), const Color(0xFFC8BE79));
      case SkillTagType.firstAid:
        return (const Color(0xFFFFEEF7), const Color(0xFFED88B7));
      case SkillTagType.childSupport:
        return (const Color(0xFFEFF7F0), const Color(0xFF90B58C));
    }
  }
}

/// スキルタグの種類
enum SkillTagType {
  physicalWork, // 力仕事
  english, // 英語
  spanish, // スペイン語
  firstAid, // 応急処置
  childSupport, // 子連れサポート
}

