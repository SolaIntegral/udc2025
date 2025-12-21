import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../domain/models/evacuation_item.dart';

part 'evacuation_items_provider.g.dart';

/// 持ち出し品チェックリストの状態管理プロバイダー
@riverpod
class EvacuationItems extends _$EvacuationItems {
  @override
  List<EvacuationItem> build() {
    // 初期データ（後で shared_preferences から読み込む）
    return const [
      EvacuationItem(
        id: 'water',
        name: '飲料水',
        isChecked: false,
      ),
      EvacuationItem(
        id: 'food',
        name: '非常食',
        isChecked: false,
      ),
      EvacuationItem(
        id: 'phone',
        name: '携帯電話・充電器',
        isChecked: false,
      ),
      EvacuationItem(
        id: 'light',
        name: '懐中電灯',
        isChecked: false,
      ),
      EvacuationItem(
        id: 'medicine',
        name: '常備薬',
        isChecked: false,
      ),
      EvacuationItem(
        id: 'id_card',
        name: '身分証明書',
        isChecked: false,
      ),
    ];
  }

  /// チェック状態を切り替える
  void toggleChecked(String id) {
    state = [
      for (final item in state)
        if (item.id == id)
          item.copyWith(isChecked: !item.isChecked)
        else
          item,
    ];
  }

  /// 新しい持ち出し品を追加
  void addItem(String name) {
    final newItem = EvacuationItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      isChecked: false,
    );
    state = [...state, newItem];
  }

  /// 持ち出し品を削除
  void removeItem(String id) {
    state = state.where((item) => item.id != id).toList();
  }

  /// 全て未チェックに戻す
  void resetAll() {
    state = [
      for (final item in state) item.copyWith(isChecked: false),
    ];
  }
}