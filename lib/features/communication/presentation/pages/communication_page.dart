import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/comm_menu_card.dart';

/// コミュニケーション画面（コミュニティホーム）
/// コミュニティ機能のメイン画面
class CommunicationPage extends StatefulWidget {
  const CommunicationPage({super.key});

  @override
  State<CommunicationPage> createState() => _CommunicationPageState();
}

class _CommunicationPageState extends State<CommunicationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFEFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ヘッダー（タイトル）
              const Text(
                'コミュニティ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.24,
                ),
              ),
              const SizedBox(height: 32),

              // コミュニティセクション
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // セクションタイトルとプレースホルダー
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'コミュニティ',
                        style: TextStyle(
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
                  const SizedBox(height: 24),
                  // メニューカード
                  Column(
                    children: [
                      CommMenuCard(
                        title: '周辺ユーザー検索',
                        description: 'Bluetoothで周辺のアプリユーザーを検索し、助け合える人を見つけます。',
                        icon: Icons.radar,
                        iconColor: Colors.orange,
                        onTap: () {
                          context.push('/communication/radar');
                        },
                      ),
                      const SizedBox(height: 16),
                      CommMenuCard(
                        title: 'グループ安否確認',
                        description: '事前に登録した信頼できるメンバーの安否を確認します。',
                        icon: Icons.family_restroom,
                        iconColor: Colors.purple,
                        onTap: () {
                          context.push('/communication/safety');
                        },
                      ),
                      const SizedBox(height: 16),
                      CommMenuCard(
                        title: 'プロフィール・支援設定',
                        description: '自分の属性やスキルを登録し、共助をスムーズにすることができます。',
                        icon: Icons.person_outline,
                        iconColor: Colors.teal,
                        onTap: () {
                          context.push('/communication/profile');
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
