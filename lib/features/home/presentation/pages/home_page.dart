import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../info/presentation/pages/info_page.dart';
import '../../../communication/presentation/pages/communication_page.dart';
import '../../../communication/presentation/pages/chat_page.dart';
import '../../../map/presentation/pages/map_page.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';

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
    InfoPage(),           // index 0: ホーム
    CommunicationPage(),  // index 1: コミュニティ
    ChatPage(),           // index 2: チャット
    MapPage(),            // index 3: マップ
  ];

  @override
  Widget build(BuildContext context) {
    final lang = ref.watch(languageProvider);

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}