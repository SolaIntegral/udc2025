import 'package:flutter/material.dart';

/// 共通で使用するウィジェット
class CommonWidgets {
  CommonWidgets._();

  /// ローディングインジケーター
  static Widget loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  /// エラーメッセージ表示
  static Widget errorMessage(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            message,
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// 空の状態表示
  static Widget emptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.inbox_outlined, size: 48, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            message,
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

