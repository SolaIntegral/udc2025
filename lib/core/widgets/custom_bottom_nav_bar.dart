import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// カスタムボトムナビゲーションバー
/// Figmaデザインに基づいたカスタムボトムナビゲーションバー
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  // SVGアイコンのURL（Figmaデザインから取得）
  static const String _imgHome = "http://localhost:3845/assets/90e4c49d0ff92f9952ed4136c06c692cb8e87f1c.svg";
  static const String _imgHome1 = "http://localhost:3845/assets/286245e70f889dcc5c4095d0b065be621c099614.svg";
  static const String _imgGroups = "http://localhost:3845/assets/a370f23af74d1c56188e44a4ebe7aad8cf936a17.svg";
  static const String _imgGroups1 = "http://localhost:3845/assets/b93c7d324be594de7f25b2ac8a39f1ca162d2fdb.svg";
  static const String _imgChatBubble = "http://localhost:3845/assets/2f0804160c00f44b3f6d09c47d199f66a0230da8.svg";
  static const String _imgChatBubble1 = "http://localhost:3845/assets/879ae70004a1789e8d5f7aab2e3303821b5c84fc.svg";
  static const String _imgMap = "http://localhost:3845/assets/46b7ca6991f0fe9f3d217b88b4b94787024f998f.svg";
  static const String _imgMap1 = "http://localhost:3845/assets/ae05b807968d878fc328db7db49d23ce82cac18c.svg";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -4),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                iconUrl: _imgHome1,
                activeIconUrl: _imgHome,
                label: 'ホーム',
                index: 0,
              ),
              _buildNavItem(
                iconUrl: _imgGroups,
                activeIconUrl: _imgGroups1,
                label: 'コミュニティ',
                index: 1,
              ),
              _buildNavItem(
                iconUrl: _imgChatBubble,
                activeIconUrl: _imgChatBubble1,
                label: 'チャット',
                index: 2,
              ),
              _buildNavItem(
                iconUrl: _imgMap,
                activeIconUrl: _imgMap1,
                label: 'マップ',
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String iconUrl,
    required String activeIconUrl,
    required String label,
    required int index,
  }) {
    final isSelected = currentIndex == index;
    final iconColor = isSelected ? const Color(0xFF0082E1) : const Color(0xFFB1B1B1);
    final iconToUse = isSelected ? activeIconUrl : iconUrl;

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.network(
                iconToUse,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  iconColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: iconColor,
                letterSpacing: -0.24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

