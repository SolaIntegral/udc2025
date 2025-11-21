import 'package:flutter/material.dart';

/// 安否ステータスページ
/// 安否ステータスの変更
class EmergencyStatusPage extends StatefulWidget {
  const EmergencyStatusPage({super.key});

  @override
  State<EmergencyStatusPage> createState() => _EmergencyStatusPageState();
}

class _EmergencyStatusPageState extends State<EmergencyStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('安否ステータス'),
      ),
      body: const Center(
        child: Text('安否ステータスページ'),
      ),
    );
  }
}

