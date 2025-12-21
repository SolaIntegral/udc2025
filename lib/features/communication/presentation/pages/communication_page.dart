import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// コミュニケーション画面（青のヘッダー）
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
      appBar: AppBar(
        title: const Text('コミュニティ'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // TODO: シェア機能
            },
            tooltip: 'シェア',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bluetoothステータス表示
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Row(
                children: [
                  const Icon(Icons.bluetooth, color: Colors.blue),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      '現在オフラインモード：半径50mの人とつながれます',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 1. 周辺ユーザー探索・レーダー画面
            _buildFeatureCard(
              context: context,
              icon: Icons.radar,
              iconColor: Colors.orange,
              title: '周辺ユーザー探索',
              subtitle: '近くに誰がいるか確認',
              description: 'Bluetoothで周辺のアプリユーザーを検索し、助け合える人を見つけます',
              badge: '5人発見',
              onTap: () {
                context.push('/communication/radar');
              },
            ),
            const SizedBox(height: 16),

            // 2. オフライン・チャット画面
            _buildFeatureCard(
              context: context,
              icon: Icons.chat_bubble_outline,
              iconColor: Colors.green,
              title: 'オフライン・チャット',
              subtitle: 'つながる・話す',
              description: '周辺の人とメッセージを交換。自動翻訳・やさしい日本語対応',
              badge: '3件の未読',
              onTap: () {
                context.push('/communication/chat');
              },
            ),
            const SizedBox(height: 16),

            // 3. グループ安否確認画面
            _buildFeatureCard(
              context: context,
              icon: Icons.family_restroom,
              iconColor: Colors.purple,
              title: 'グループ安否確認',
              subtitle: '身内の安全',
              description: '事前に登録した信頼できるメンバーの安否を確認',
              badge: '全員無事',
              onTap: () {
                context.push('/communication/safety');
              },
            ),
            const SizedBox(height: 16),

            // 4. プロフィール・支援設定画面
            _buildFeatureCard(
              context: context,
              icon: Icons.person_outline,
              iconColor: Colors.teal,
              title: 'プロフィール・支援設定',
              subtitle: '信頼とマッチングの準備',
              description: '自分の属性やスキルを登録し、共助をスムーズに',
              onTap: () {
                context.push('/communication/profile');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String description,
    String? badge,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // アイコン
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 32),
              ),
              const SizedBox(width: 16),
              // テキスト情報
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (badge != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              badge,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

