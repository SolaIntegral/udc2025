/// String拡張メソッド
extension StringExtensions on String {
  /// 空文字列かどうかをチェック（null安全）
  bool get isNullOrEmpty => isEmpty;

  /// 空文字列でないかどうかをチェック
  bool get isNotNullOrEmpty => !isEmpty;

  /// やさしい日本語への変換（簡易版）
  String toEasyJapanese() {
    // TODO: 実際の変換ロジックを実装
    return this;
  }
}

