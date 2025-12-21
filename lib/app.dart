import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'features/onboarding/presentation/pages/onboarding_page.dart';
import 'features/map/presentation/pages/map_page.dart';
import 'features/group/presentation/pages/group_list_page.dart';
import 'features/group/presentation/pages/group_create_page.dart';
import 'features/group/presentation/pages/group_member_add_page.dart';
import 'features/emergency/presentation/pages/emergency_status_page.dart';
import 'features/emergency/presentation/pages/sos_page.dart';

/// アプリケーションのルーティング設定
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/emergency',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/map',
        builder: (context, state) => const MapPage(),
      ),
      GoRoute(
        path: '/groups',
        builder: (context, state) => const GroupListPage(),
      ),
      GoRoute(
        path: '/groups/create',
        builder: (context, state) => const GroupCreatePage(),
      ),
      GoRoute(
        path: '/groups/:groupId/members/add',
        builder: (context, state) {
          final groupId = state.pathParameters['groupId']!;
          return GroupMemberAddPage(groupId: groupId);
        },
      ),
      GoRoute(
        path: '/emergency',
        builder: (context, state) => const EmergencyStatusPage(),
      ),
      GoRoute(
        path: '/sos',
        builder: (context, state) => const SosPage(),
      ),
    ],
  );
});

/// アプリケーションウィジェット
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Resilient Mesh Nav',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

