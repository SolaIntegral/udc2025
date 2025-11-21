import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

/// オンボーディングプロバイダー
@riverpod
class Onboarding extends _$Onboarding {
  @override
  bool build() {
    return false;
  }

  /// オンボーディングを完了
  void complete() {
    state = true;
  }
}

