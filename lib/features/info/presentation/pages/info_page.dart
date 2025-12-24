import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../emergency/presentation/providers/emergency_preparedness_provider.dart';

/// 情報・更新画面（紫のヘッダー）
/// 災害情報、避難情報、最終更新日時などを表示
class InfoPage extends ConsumerStatefulWidget {
  const InfoPage({super.key});

  @override
  ConsumerState<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends ConsumerState<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('災害情報'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 最終更新日時
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.update, color: Colors.purple),
                    const SizedBox(width: 8),
                    const Text(
                      '最終更新: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateTime.now().toString().substring(0, 19),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 災害についての説明と避難の必要性
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '現在の災害状況',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '地震が発生しました。安全な場所に避難してください。',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red.shade200),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.warning, color: Colors.red),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '避難が必要です',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 防災準備（持ち出し品・緊急連絡先）
            Consumer(
              builder: (context, ref, _) {
                final preparedness = ref.watch(emergencyPreparednessProvider);

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '避難時チェック',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // 持ち出し品
                        const Text(
                          '持ち出し品',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        ...preparedness.items.map(
                          (item) => Row(
                            children: [
                              Checkbox(
                                value: item.checked,
                                onChanged: (_) {
                                  ref
                                      .read(emergencyPreparednessProvider.notifier)
                                      .toggleItem(item.id);
                                },
                              ),
                              Expanded(child: Text(item.name)),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),

                        // 緊急連絡先
                        const Text(
                          '緊急連絡先',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        ...preparedness.contacts.map(
                          (contact) => InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('通話中'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.phone_in_talk,
                                          size: 48,
                                          color: Colors.green,
                                        ),
                                        const SizedBox(height: 12),
                                        Text('${contact.name} に発信中…'),
                                        const SizedBox(height: 4),
                                        Text(
                                          contact.phone,
                                          style: const TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('キャンセル'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.phone, size: 18, color: Colors.green),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${contact.name}：${contact.phone}',
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // 避難情報
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '避難情報',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow(
                      icon: Icons.help_outline,
                      title: 'なぜ避難するか',
                      content: '建物の倒壊や火災の危険があります。',
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      icon: Icons.timer,
                      title: '避難までの時間',
                      content: '30分以内に避難を開始してください。',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // コラムセクション（女性問題、応急処置）
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'コラム',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildColumnItem(
                      icon: Icons.person_outline,
                      title: '女性向け情報',
                      content: '避難所での安全対策や必要な物品について',
                    ),
                    const Divider(),
                    _buildColumnItem(
                      icon: Icons.medical_services,
                      title: '応急処置',
                      content: '怪我をした場合の基本的な応急処置方法',
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

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.purple),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColumnItem({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return InkWell(
      onTap: () {
        // TODO: コラム詳細ページへ遷移
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.purple),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
