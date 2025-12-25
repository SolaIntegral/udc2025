import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/emergency_preparedness_provider.dart';

/// 防災準備ページ
/// 平常時に持ち出し品や緊急連絡先を事前に設定する
class EmergencyStatusPage extends ConsumerStatefulWidget {
  const EmergencyStatusPage({super.key});

  @override
  ConsumerState<EmergencyStatusPage> createState() => _EmergencyStatusPageState();
}

class _EmergencyStatusPageState extends ConsumerState<EmergencyStatusPage> {
  @override
  Widget build(BuildContext context) {
    final preparedness = ref.watch(emergencyPreparednessProvider);
    final notifier = ref.read(emergencyPreparednessProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('防災準備'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEvacuationItems(preparedness, notifier),
            const SizedBox(height: 16),
            _buildEmergencyContacts(preparedness),
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

  /// 持ち出し品チェックリスト
  Widget _buildEvacuationItems(
      dynamic preparedness, dynamic notifier) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '持ち出し品チェックリスト',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton.icon(
                  onPressed: _showAddItemDialog,
                  icon: const Icon(Icons.add),
                  label: const Text('追加'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              '※ 平常時に防災用品を準備・編集できます',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            ...preparedness.items.map(
              (item) => Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      value: item.checked,
                      title: Text(item.name),
                      onChanged: (_) {
                        notifier.toggleItem(item.id);
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      notifier.removeItem(item.id);
                    },
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
  Widget _buildEmergencyContacts(dynamic preparedness) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '緊急連絡先',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton.icon(
                  onPressed: _showAddContactDialog,
                  icon: const Icon(Icons.add),
                  label: const Text('追加'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...preparedness.contacts.map(
              (contact) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(contact.name),
                    Text(
                      contact.phone,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
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
}