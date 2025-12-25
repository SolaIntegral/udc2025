import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
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
                  // ユーザーアイコン（プレースホルダー）
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
                ],
              ),
              const SizedBox(height: 32),

              // 現在の情報セクション
              _buildSection(
                title: '現在の情報',
                child: CommNotificationCard(
                  title: '地震発生',
                  description: '地震が発生しました。安全な場所に避難してください。',
                  onTap: () {
                    // TODO: 詳細情報ページへ遷移
                  },
                ),
              ),
              const SizedBox(height: 24),

              // 避難に関する情報セクション
              _buildSection(
                title: '避難に関する情報',
                child: CommNotificationCard(
                  title: '地震発生',
                  description: '地震が発生しました。安全な場所に避難してください。',
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

              // 緊急連絡先セクション
              _buildSection(
                title: '緊急連絡先',
                child: _buildEmergencyContacts(preparedness, notifier),
              ),
              const SizedBox(height: 24),

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
                      onTap: () {
                        // TODO: コラム詳細ページへ遷移
                      },
                    ),
                    const SizedBox(width: 16),
                    InfoColumnCard(
                      title: '女性向け情報',
                      description: '避難所での安全対策や必要な物品について学びましょう。',
                      onTap: () {
                        // TODO: コラム詳細ページへ遷移
                      },
                    ),
                    const SizedBox(width: 16),
                    InfoColumnCard(
                      title: '過去の災害から学ぶ',
                      description: '過去の災害でどのような被害が及んだのか、学びましょう',
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

  /// 持ち出し品チェックリスト
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '※ 平常時に防災用品を準備・編集できます',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                TextButton.icon(
                  onPressed: _showAddItemDialog,
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('追加'),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...preparedness.items.map(
              (item) => Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      value: item.checked,
                      title: Text(
                        item.name,
                        style: const TextStyle(fontSize: 14),
                      ),
                      onChanged: (_) {
                        notifier.toggleItem(item.id);
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                    onPressed: () {
                      notifier.removeItem(item.id);
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 緊急連絡先リスト
  Widget _buildEmergencyContacts(
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox.shrink(),
                TextButton.icon(
                  onPressed: _showAddContactDialog,
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('追加'),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...preparedness.contacts.map(
              (contact) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        contact.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          contact.phone,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.phone, size: 20),
                          onPressed: () async {
                            final uri = Uri.parse('tel:${contact.phone}');
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            }
                          },
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                          onPressed: () {
                            notifier.removeContact(contact.name);
                          },
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddItemDialog() {
    final controller = TextEditingController();
    final notifier = ref.read(emergencyPreparednessProvider.notifier);

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('持ち出し品を追加'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: '例：眼鏡、ペット用品',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('キャンセル'),
            ),
            ElevatedButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isNotEmpty) {
                  notifier.addItem(text);
                }
                Navigator.pop(context);
              },
              child: const Text('追加'),
            ),
          ],
        );
      },
    );
  }

  void _showAddContactDialog() {
    final nameController = TextEditingController();
    final numberController = TextEditingController();
    final notifier = ref.read(emergencyPreparednessProvider.notifier);

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('緊急連絡先を追加'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: '名前（例：家族、会社）',
                ),
                autofocus: true,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: numberController,
                decoration: const InputDecoration(
                  hintText: '電話番号',
                ),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('キャンセル'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final number = numberController.text.trim();
                if (name.isNotEmpty && number.isNotEmpty) {
                  notifier.addContact(name, number);
                }
                Navigator.pop(context);
              },
              child: const Text('追加'),
            ),
          ],
        );
      },
    );
  }
}
