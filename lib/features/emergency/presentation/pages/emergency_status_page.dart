import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// 安否ステータスページ
/// 災害発生時に、避難情報・持ち出し品・緊急連絡先を表示する
class EmergencyStatusPage extends StatefulWidget {
  const EmergencyStatusPage({super.key});

  @override
  State<EmergencyStatusPage> createState() => _EmergencyStatusPageState();
}

class _EmergencyStatusPageState extends State<EmergencyStatusPage> {
  final Map<String, bool> _evacuationItems = {
    '飲料水': false,
    '非常食': false,
    '常備薬': false,
    '現金(小銭)': false,
    'お薬手帳': false,
    '携帯電話・充電器': false,
    '懐中電灯': false,
    '身分証明書': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('安否ステータス'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddItemDialog,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEmergencyAlert(),
            const SizedBox(height: 16),
            _buildEvacuationItems(),
            const SizedBox(height: 16),
            _buildEmergencyContacts(),
          ],
        ),
      ),
    );
  }

  /// 緊急避難通知エリア
  Widget _buildEmergencyAlert() {
    return Card(
      color: Colors.red.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
              size: 40,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '緊急避難情報',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '災害が発生しました。安全な場所へ速やかに避難してください。',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddItemDialog() {
    final controller = TextEditingController();

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
                if (text.isNotEmpty && !_evacuationItems.containsKey(text)) {
                  setState(() {
                    _evacuationItems[text] = false;
                  });
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
  Widget _buildEvacuationItems() {
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
            ..._evacuationItems.entries.map(
              (entry) => Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      value: entry.value,
                      title: Text(entry.key),
                      onChanged: (checked) {
                        setState(() {
                          _evacuationItems[entry.key] = checked ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        _evacuationItems.remove(entry.key);
                      });
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
  Widget _buildEmergencyContacts() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '緊急連絡先',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildContactRow('警察', '110'),
            _buildContactRow('消防・救急', '119'),
            _buildContactRow('災害用伝言ダイヤル', '171'),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(String label, String number) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse('tel:$number');
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(
              number,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}