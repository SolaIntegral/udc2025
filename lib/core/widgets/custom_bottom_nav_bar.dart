import 'package:flutter/material.dart';

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
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: 'ホーム',
                index: 0,
              ),
              _buildNavItem(
                icon: Icons.groups_outlined,
                activeIcon: Icons.groups,
                label: 'コミュニティ',
                index: 1,
              ),
              _buildNavItem(
                icon: Icons.chat_bubble_outline,
                activeIcon: Icons.chat_bubble,
                label: 'チャット',
                index: 2,
              ),
              _buildNavItem(
                icon: Icons.map_outlined,
                activeIcon: Icons.map,
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
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final isSelected = currentIndex == index;
    final iconColor = isSelected ? const Color(0xFF0082E1) : const Color(0xFFB1B1B1);

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              size: 24,
              color: iconColor,
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

