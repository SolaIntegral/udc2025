import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_provider.g.dart';

/// アプリ内で使用する言語
enum AppLanguage {
  ja,
  en,
  zh,
  ko,
}

@riverpod
class Language extends _$Language {
  @override
  AppLanguage build() => AppLanguage.ja;

  /// 言語を切り替える
  void setLanguage(AppLanguage lang) {
    state = lang;
  }
}