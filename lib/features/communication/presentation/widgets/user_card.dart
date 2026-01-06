import 'package:flutter/material.dart';
import '../../../../domain/models/user_model.dart';
import '../../../../core/widgets/skill_tag.dart';
import '../../../../core/widgets/user_avatar_icon.dart';

/// ユーザーカード
/// コミュニティ画面（レーダー画面）で周辺ユーザーを表示するカード
class UserCard extends StatelessWidget {
  final UserModel user;
  final double? distance; // 距離（メートル）
  final VoidCallback? onTap;

  const UserCard({
    super.key,
    required this.user,
    this.distance,
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
                // アイコン
                UserAvatarIcon(
                  type: _getAvatarType(user),
                  size: 58,
                  showStatusIndicator: true,
                  statusIndicator: _getStatusIndicator(user.status),
                ),
                const SizedBox(width: 21),
                // ユーザー情報
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 名前と距離・バッテリー情報
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2F3244),
                              letterSpacing: -0.24,
                            ),
                          ),
                          const SizedBox(height: 4),
                          _buildUserInfo(),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // スキルタグ（言語タグとスキルタグを混在）
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: [
                          // 言語タグ
                          if (user.language.isNotEmpty)
                            SkillTag(
                              label: _getLanguageLabel(user.language),
                              backgroundColor: const Color(0xFFE9F5FF),
                              textColor: const Color(0xFF7B9BCE),
                            ),
                          // スキルタグ
                          if (user.skills != null && user.skills!.isNotEmpty)
                            ...user.skills!.take(3).map((skill) {
                              final tagType = _getSkillTagType(skill);
                              return SkillTag(
                                label: skill,
                                backgroundColor: _getSkillTagBackgroundColor(tagType),
                                textColor: _getSkillTagTextColor(tagType),
                              );
                            }),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 21),
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

  Widget _buildUserInfo() {
    return Row(
      children: [
        if (distance != null) ...[
          const Icon(
            Icons.location_on,
            size: 16,
            color: Color(0xFF838383),
          ),
          const SizedBox(width: 2),
          Text(
            '${distance!.toStringAsFixed(0)}m',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF838383),
              letterSpacing: -0.24,
            ),
          ),
          const SizedBox(width: 8),
        ],
        const Icon(
          Icons.battery_5_bar,
          size: 16,
          color: Color(0xFF838383),
        ),
        const SizedBox(width: 2),
        Text(
          '${user.batteryLevel}%',
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF838383),
            letterSpacing: -0.24,
          ),
        ),
      ],
    );
  }

  UserAvatarType _getAvatarType(UserModel user) {
    // Figmaデザインに合わせてユーザー名に基づいてアイコンを決定
    if (user.name.contains('田中 太郎')) {
      return UserAvatarType.robot; // ロボット
    } else if (user.name.contains('李 明')) {
      return UserAvatarType.defaultCat; // デフォルト（猫）
    } else if (user.name.contains('John Smith')) {
      return UserAvatarType.alien; // エイリアン
    } else if (user.name.contains('山田')) {
      return UserAvatarType.defaultCat; // デフォルト（猫）
    }
    return UserAvatarType.defaultCat; // デフォルト
  }

  UserStatusIndicator _getStatusIndicator(UserStatus status) {
    switch (status) {
      case UserStatus.ok:
        return UserStatusIndicator.online;
      case UserStatus.sos:
        return UserStatusIndicator.sos;
      case UserStatus.unknown:
        return UserStatusIndicator.offline;
    }
  }

  String _getLanguageLabel(String language) {
    switch (language) {
      case 'ja':
        return '日本語';
      case 'en':
        return '英語';
      case 'es':
        return 'スペイン語';
      case 'zh':
        return '中国語';
      case 'ko':
        return '韓国語';
      default:
        return language;
    }
  }

  SkillTagType _getSkillTagType(String skill) {
    // スキル文字列からタグタイプを判定
    if (skill.contains('力仕事') || skill.contains('力')) {
      return SkillTagType.physicalWork;
    } else if (skill.contains('英語') || skill.contains('English')) {
      return SkillTagType.english;
    } else if (skill.contains('スペイン') || skill.contains('Spanish')) {
      return SkillTagType.spanish;
    } else if (skill.contains('応急処置') || skill.contains('first aid')) {
      return SkillTagType.firstAid;
    } else if (skill.contains('子連れ') || skill.contains('child') || skill.contains('サポート')) {
      return SkillTagType.childSupport;
    }
    return SkillTagType.physicalWork; // デフォルト
  }

  Color _getSkillTagBackgroundColor(SkillTagType type) {
    switch (type) {
      case SkillTagType.physicalWork:
        return const Color(0xFFFFE9E9); // 力仕事
      case SkillTagType.english:
        return const Color(0xFFE9F5FF); // 英語
      case SkillTagType.spanish:
        return const Color(0xFFFFFBE9); // スペイン語
      case SkillTagType.firstAid:
        return const Color(0xFFFFEEF7); // 応急処置
      case SkillTagType.childSupport:
        return const Color(0xFFEFF7F0); // 子連れサポート
    }
  }

  Color _getSkillTagTextColor(SkillTagType type) {
    switch (type) {
      case SkillTagType.physicalWork:
        return const Color(0xFFD27979); // 力仕事
      case SkillTagType.english:
        return const Color(0xFF7B9BCE); // 英語
      case SkillTagType.spanish:
        return const Color(0xFFC8BE79); // スペイン語
      case SkillTagType.firstAid:
        return const Color(0xFFED88B7); // 応急処置
      case SkillTagType.childSupport:
        return const Color(0xFF90B58C); // 子連れサポート
    }
  }
}

