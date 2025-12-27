import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../emergency/presentation/providers/emergency_preparedness_provider.dart';
import '../../../../core/providers/language_provider.dart';
import '../../../../core/i18n/app_strings.dart';

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
    final lang = ref.watch(languageProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t('info_title', lang)),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                        Text(
                          t('last_updated', lang),
                          style: const TextStyle(fontWeight: FontWeight.bold),
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

                // 現在の災害状況
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t('current_disaster', lang),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          t('earthquake_message', lang),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.red.shade200),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.warning, color: Colors.red),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  t('evacuation_required', lang),
                                  style: const TextStyle(
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

                // 防災準備
                Consumer(
                  builder: (context, ref, _) {
                    final preparedness =
                        ref.watch(emergencyPreparednessProvider);

                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t('evacuation_check', lang),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),

                            Text(
                              t('evacuation_items', lang),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            ...preparedness.items.map(
                              (item) => Row(
                                children: [
                                  Checkbox(
                                    value: item.checked,
                                    onChanged: (_) {
                                      ref
                                          .read(
                                              emergencyPreparednessProvider
                                                  .notifier)
                                          .toggleItem(item.id);
                                    },
                                  ),
                                  Expanded(child: Text(item.name)),
                                ],
                              ),
                            ),

                            const SizedBox(height: 12),

                            Text(
                              t('emergency_contacts', lang),
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
                                        title: Text(t('calling', lang)),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(Icons.phone_in_talk,
                                                size: 48,
                                                color: Colors.green),
                                            const SizedBox(height: 12),
                                            Text(
                                              '${contact.name}${t('calling_suffix', lang)}',
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              contact.phone,
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: Text(t('cancel', lang)),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.phone,
                                          size: 18, color: Colors.green),
                                      const SizedBox(width: 8),
                                      Text(
                                        '${contact.name}：${contact.phone}',
                                        style: const TextStyle(
                                          decoration:
                                              TextDecoration.underline,
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
                        Text(
                          t('evacuation_info', lang),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildInfoRow(
                          icon: Icons.help_outline,
                          title: t('why_evacuate', lang),
                          content: t('why_evacuate_desc', lang),
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow(
                          icon: Icons.timer,
                          title: t('evacuation_time', lang),
                          content: t('evacuation_time_desc', lang),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // コラム
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t('column', lang),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildColumnItem(
                          icon: Icons.person_outline,
                          title: t('women_info', lang),
                          content: t('women_info_desc', lang),
                        ),
                        const Divider(),
                        _buildColumnItem(
                          icon: Icons.medical_services,
                          title: t('first_aid', lang),
                          content: t('first_aid_desc', lang),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 言語切替ボタン
          Positioned(
            top: 12,
            right: 12,
            child: _LanguageSwitcher(),
          ),
        ],
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
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text(content,
                  style:
                      const TextStyle(fontSize: 14, color: Colors.grey)),
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
      onTap: () {},
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
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(content,
                      style: const TextStyle(
                          fontSize: 14, color: Colors.grey)),
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

/// 右上の言語切替ウィジェット
/// ボタン直下に選択肢を表示する（PopupMenu）
class _LanguageSwitcher extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(languageProvider);

    return PopupMenuButton<AppLanguage>(
      offset: const Offset(0, 36), // ボタンの少し下に表示
      onSelected: (selected) {
        ref.read(languageProvider.notifier).setLanguage(selected);
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: AppLanguage.ja,
          child: const Text('日語'),
        ),
        PopupMenuItem(
          value: AppLanguage.en,
          child: const Text('English'),
        ),
        PopupMenuItem(
          value: AppLanguage.zh,
          child: const Text('简体中文'),
        ),
        PopupMenuItem(
          value: AppLanguage.ko,
          child: const Text('한국어'),
        ),
      ],
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            children: [
              const Icon(Icons.language, size: 18),
              const SizedBox(width: 4),
              Text(_currentLabel(lang)),
            ],
          ),
        ),
      ),
    );
  }

  /// 現在選択中の言語表示
  String _currentLabel(AppLanguage lang) {
  switch (lang) {
    case AppLanguage.ja:
      return '日語';
    case AppLanguage.en:
      return 'English';
    case AppLanguage.zh:
      return '简体中文';
    case AppLanguage.ko:
      return '한국어';
  }
}
}