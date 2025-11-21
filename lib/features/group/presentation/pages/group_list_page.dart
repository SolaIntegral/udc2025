import 'package:flutter/material.dart';

/// グループ一覧ページ
class GroupListPage extends StatefulWidget {
  const GroupListPage({super.key});

  @override
  State<GroupListPage> createState() => _GroupListPageState();
}

class _GroupListPageState extends State<GroupListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('信頼できるグループ'),
      ),
      body: const Center(
        child: Text('グループ一覧ページ'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: グループ作成ページへ遷移
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

