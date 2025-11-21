import 'package:flutter/material.dart';

/// オンボーディングページ
/// 初回起動時のユーザー登録・権限設定
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('初期設定'),
      ),
      body: const Center(
        child: Text('オンボーディングページ'),
      ),
    );
  }
}

