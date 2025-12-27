import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../info/presentation/pages/info_page.dart';
import '../../../communication/presentation/pages/communication_page.dart';
import '../../../map/presentation/pages/map_page.dart';
import '../../../emergency/presentation/pages/emergency_status_page.dart';

import '../../../../core/i18n/app_strings.dart' as strings;
import '../../../../core/providers/language_provider.dart';

/// ホーム画面
/// BottomNavigationBarで画面を切り替える
/// 表示文言は多言語対応（LanguageProvider）
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    InfoPage(),
    CommunicationPage(),
    MapPage(),
    EmergencyStatusPage(), // 防災準備（設定用）
  ];

  @override
  Widget build(BuildContext context) {
    final lang = ref.watch(languageProvider);

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.info_outline),
            activeIcon: const Icon(Icons.info),
            label: strings.t('tab_info', lang),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_bubble_outline),
            activeIcon: const Icon(Icons.chat_bubble),
            label: strings.t('tab_community', lang),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.map_outlined),
            activeIcon: const Icon(Icons.map),
            label: strings.t('tab_map', lang),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.backpack_outlined),
            activeIcon: const Icon(Icons.backpack),
            label: strings.t('tab_preparedness', lang),
          ),
        ],
      ),
    );
  }
}