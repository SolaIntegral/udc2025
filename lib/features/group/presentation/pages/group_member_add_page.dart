import 'package:flutter/material.dart';

/// グループメンバー追加ページ
/// QRコードやID入力でメンバーを追加
class GroupMemberAddPage extends StatefulWidget {
  final String groupId;

  const GroupMemberAddPage({
    super.key,
    required this.groupId,
  });

  @override
  State<GroupMemberAddPage> createState() => _GroupMemberAddPageState();
}

class _GroupMemberAddPageState extends State<GroupMemberAddPage> {
  final _userIdController = TextEditingController();

  @override
  void dispose() {
    _userIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メンバー追加'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _userIdController,
              decoration: const InputDecoration(
                labelText: 'ユーザーID',
                border: OutlineInputBorder(),
                hintText: 'ユーザーIDを入力またはQRコードをスキャン',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: QRコードスキャン
              },
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('QRコードをスキャン'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_userIdController.text.isNotEmpty) {
                  // TODO: メンバー追加ロジック
                  Navigator.of(context).pop();
                }
              },
              child: const Text('追加'),
            ),
          ],
        ),
      ),
    );
  }
}

