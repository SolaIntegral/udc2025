import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../widgets/comm_notification_card.dart';
import '../widgets/info_column_card.dart';
import '../../../emergency/presentation/providers/emergency_preparedness_provider.dart';

/// 情報・更新画面（ホーム画面）
/// 災害情報、避難情報、学びのコラム、持ち出し品チェックリスト、緊急連絡先などを表示
class InfoPage extends ConsumerStatefulWidget {
  const InfoPage({super.key});

  @override
  ConsumerState<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends ConsumerState<InfoPage> {
  @override
  Widget build(BuildContext context) {
    final preparedness = ref.watch(emergencyPreparednessProvider);
    final notifier = ref.read(emergencyPreparednessProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFFFDFEFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ヘッダー（タイトルとアイコン）
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'ホーム',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -0.24,
                    ),
                  ),
                  // ユーザーアイコン（通知ドット付き）
                  Stack(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                      // 通知ドット（緑）
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color(0xFF00D26A),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // 現在の情報セクション
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '現在の情報',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.24,
                        ),
                      ),
                      // 最終更新日時
                      Text(
                        '最終更新 ${_getFormattedDateTime()}',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFD5D5D5),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // 津波警報カード（危険タイプ）
                  CommNotificationCard(
                    title: '津波警報 要避難',
                    description: '津波が発生しました。直ちに安全な場所に避難してください。',
                    type: CommNotificationType.danger,
                    onTap: () {
                      // TODO: 詳細情報ページへ遷移
                    },
                  ),
                  const SizedBox(height: 12),
                  // 地震発生カード（警告タイプ）
                  CommNotificationCard(
                    title: '地震発生',
                    description: '地震が発生しました。身の安全を確保して、情報を待ちましょう',
                    type: CommNotificationType.warning,
                    onTap: () {
                      // TODO: 詳細情報ページへ遷移
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 避難に関する情報セクション
              _buildSection(
                title: '避難に関する情報',
                child: CommNotificationCard(
                  title: '災害の情報なし',
                  description: '現時点での災害はありません。\n日頃の意識を持ちましょう。',
                  type: CommNotificationType.success,
                  onTap: () {
                    // TODO: 詳細情報ページへ遷移
                  },
                ),
              ),
              const SizedBox(height: 24),

              // 持ち出し品チェックリストセクション
              _buildSection(
                title: '持ち出し品チェックリスト',
                child: _buildEvacuationItems(preparedness, notifier),
              ),
              const SizedBox(height: 24),

              // 緊急連絡先セクション（2枚目に含まれる可能性があるため、一旦コメントアウト）
              // _buildSection(
              //   title: '緊急連絡先',
              //   child: _buildEmergencyContacts(preparedness, notifier),
              // ),
              // const SizedBox(height: 24),

              // 学びのコラムセクション
              const Text(
                '学びのコラム',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.24,
                ),
              ),
              const SizedBox(height: 12),
              // コラムカードを横並びで表示
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InfoColumnCard(
                      title: '適切な応急処置',
                      description: '怪我をした場合の基本的な応急処置方法を学びましょう。',
                      image: Image.network(
                        'http://localhost:3845/assets/e344e8860b778d7fc13f8b376acdc3533ae3566a.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.image, color: Colors.grey, size: 32),
                          );
                        },
                      ),
                      onTap: () {
                        // TODO: コラム詳細ページへ遷移
                      },
                    ),
                    const SizedBox(width: 16),
                    InfoColumnCard(
                      title: '女性向け情報',
                      description: '避難所での安全対策や必要な物品について学びましょう。',
                      imageHeight: 101, // 女性向け情報は101px
                      image: Image.network(
                        'http://localhost:3845/assets/9f12d372cef0312478f023ee1be5c6279cd332eb.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.image, color: Colors.grey, size: 32),
                          );
                        },
                      ),
                      onTap: () {
                        // TODO: コラム詳細ページへ遷移
                      },
                    ),
                    const SizedBox(width: 16),
                    InfoColumnCard(
                      title: '過去の災害から学ぶ',
                      description: '過去の災害でどのような被害が及んだのか、学びましょう',
                      image: Image.network(
                        'http://localhost:3845/assets/588712f261884a9f65430f1711c51c0e9aea210d.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.image, color: Colors.grey, size: 32),
                          );
                        },
                      ),
                      onTap: () {
                        // TODO: コラム詳細ページへ遷移
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  /// セクションを構築
  Widget _buildSection({
    required String title,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: -0.24,
              ),
            ),
            // 右側のプレースホルダー（Figmaデザインに合わせて）
            Container(
              width: 111,
              height: 13,
              color: const Color(0xFFF7F7F7),
            ),
          ],
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }

  /// 持ち出し品チェックリスト（Figmaデザインに合わせて実装）
  Widget _buildEvacuationItems(
      EmergencyPreparednessState preparedness, EmergencyPreparedness notifier) {
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
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...preparedness.items.map(
              (item) => _buildEvacuationItemRow(item, notifier),
            ),
          ],
        ),
      ),
    );
  }

  /// 持ち出し品アイテムの行（Figmaデザインに合わせて実装）
  Widget _buildEvacuationItemRow(
      dynamic item, EmergencyPreparedness notifier) {
    final isChecked = item.checked;
    final iconBackgroundColor =
        isChecked ? const Color(0xFFEDFFE5) : const Color(0xFFF4F4F4);

    return InkWell(
      onTap: () => notifier.toggleItem(item.id),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 14),
        child: Row(
          children: [
            const SizedBox(width: 16),
            // アイコンエリア
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(5.793),
              ),
              padding: const EdgeInsets.all(9.414),
              child: isChecked
                  ? const Icon(
                      Icons.check,
                      color: Color(0xFF00D26A),
                      size: 24,
                    )
                  : Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD0D0D0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
            ),
            const SizedBox(width: 30),
            // アイテム名
            Expanded(
              child: Text(
                item.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2F3244),
                  letterSpacing: -0.24,
                ),
              ),
            ),
            const SizedBox(width: 30),
            // 削除アイコン
            GestureDetector(
              onTap: () => notifier.removeItem(item.id),
              child: const Icon(
                Icons.delete_outline,
                size: 16,
                color: Color(0xFF838383),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  /// フォーマットされた日時を取得
  String _getFormattedDateTime() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy/MM/dd/HHmm');
    return formatter.format(now);
  }
}
