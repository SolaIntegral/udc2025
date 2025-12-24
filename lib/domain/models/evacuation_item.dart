/// 避難時の持ち出し品を表すモデル
class EvacuationItem {
  /// 一意なID（削除・更新用）
  final String id;

  /// 表示名（例：飲料水、非常食）
  final String name;

  /// 持ち出し確認済みかどうか
  final bool checked;

  const EvacuationItem({
    required this.id,
    required this.name,
    this.checked = false,
  });

  /// チェック状態を更新した新しいインスタンスを返す
  EvacuationItem copyWith({
    String? id,
    String? name,
    bool? checked,
  }) {
    return EvacuationItem(
      id: id ?? this.id,
      name: name ?? this.name,
      checked: checked ?? this.checked,
    );
  }

  /// Map → Model（shared_preferences 用）
  factory EvacuationItem.fromMap(Map<String, dynamic> map) {
    return EvacuationItem(
      id: map['id'] as String,
      name: map['name'] as String,
      checked: (map['checked'] as bool?) ?? (map['isChecked'] as bool?) ?? false,
    );
  }

  /// Model → Map（shared_preferences 用）
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'checked': checked,
    };
  }
}