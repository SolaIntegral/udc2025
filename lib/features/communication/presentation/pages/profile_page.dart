import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../domain/models/user_model.dart';
import '../../../../data/repositories/user_repository.dart';
import '../../../../core/widgets/skill_tag.dart';
import '../widgets/comm_menu_card.dart';
import '../../../../core/widgets/language_filter_tag.dart';

/// マイページ（表示用）
/// 自分のプロフィール情報を表示する画面
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final _userRepository = UserRepository();
  UserModel? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = await _userRepository.getCurrentUser();
    if (mounted) {
      setState(() {
        _currentUser = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // モックデータ（実際のユーザーデータがない場合）
    final displayName = _currentUser?.name ?? '田中 太郎';
    final displayUserId = _currentUser?.id ?? 'tanakataro105';
    final skills = _currentUser?.skills ?? [
      '応急処置',
      'スペイン語',
      '子連れサポート',
      '英語',
      '力仕事',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDFEFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ヘッダー（タイトル）
              const Text(
                'マイページ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.24,
                ),
              ),
              const SizedBox(height: 64),

              // プロフィールセクション
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // プロフィールアイコン（通知ドット付き）
                  Stack(
                    children: [
                      Container(
                        width: 92,
                        height: 92,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '😸',
                            style: TextStyle(fontSize: 55),
                          ),
                        ),
                      ),
                      // 通知ドット（緑）
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 19.034,
                          height: 19.034,
                          decoration: const BoxDecoration(
                            color: Color(0xFF00D26A),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  // ユーザー情報
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2F3244),
                            letterSpacing: -0.24,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          displayUserId,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFB5B5B5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // アクションボタン（共有・編集）
                  Row(
                    children: [
                      LanguageFilterTag(
                        label: '共有',
                        isSelected: false,
                      ),
                      const SizedBox(width: 8),
                      LanguageFilterTag(
                        label: '編集',
                        isSelected: false,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // 「できること」セクション
              const Text(
                'できること',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.24,
                ),
              ),
              const SizedBox(height: 12),
              Card(
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
                  padding: const EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: skills.map((skill) {
                      return SkillTag(
                        label: skill,
                        type: _getSkillTagType(skill),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 「つながり」セクション
              const Text(
                'つながり',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.24,
                ),
              ),
              const SizedBox(height: 12),
              CommMenuCard(
                title: 'つながり一覧',
                description: '自分の属性やスキルを登録し、共助をスムーズにすることができます。',
                iconBackgroundColor: const Color(0xFFFBFFF0), // 黄緑系
                iconWidget: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBFFF0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text('👤', style: TextStyle(fontSize: 24)),
                  ),
                ),
                onTap: () {
                  // TODO: つながり一覧ページへ遷移
                },
              ),
              const SizedBox(height: 16),
              CommMenuCard(
                title: 'グループ安否確認',
                description: '事前に登録した信頼できるメンバーの安否を確認します。',
                iconBackgroundColor: const Color(0xFFF0F4FF), // 青系
                iconWidget: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F4FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text('👨‍👩‍👧', style: TextStyle(fontSize: 24)),
                  ),
                ),
                onTap: () {
                  // TODO: グループ安否確認ページへ遷移
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  /// スキル文字列からタグタイプを判定
  SkillTagType _getSkillTagType(String skill) {
    if (skill.contains('応急処置') || skill.contains('first aid')) {
      return SkillTagType.firstAid;
    } else if (skill.contains('スペイン') || skill.contains('Spanish')) {
      return SkillTagType.spanish;
    } else if (skill.contains('子連れ') || skill.contains('child') || skill.contains('サポート')) {
      return SkillTagType.childSupport;
    } else if (skill.contains('英語') || skill.contains('English')) {
      return SkillTagType.english;
    } else if (skill.contains('力仕事') || skill.contains('力')) {
      return SkillTagType.physicalWork;
    }
    return SkillTagType.physicalWork; // デフォルト
  }
}

