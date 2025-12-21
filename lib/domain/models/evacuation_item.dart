/// 避難時の持ち出し品を表すモデル
class EvacuationItem {
  /// 一意なID（削除・更新用）
  final String id;

  /// 表示名（例：飲料水、非常食）
  final String name;

  /// 持ち出し確認済みかどうか
  final bool isChecked;

  const EvacuationItem({
    required this.id,
    required this.name,
    required this.isChecked,
  });

  /// チェック状態を更新した新しいインスタンスを返す
  EvacuationItem copyWith({
    String? id,
    String? name,
    bool? isChecked,
  }) {
    return EvacuationItem(
      id: id ?? this.id,
      name: name ?? this.name,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  /// Map → Model（shared_preferences 用）
  factory EvacuationItem.fromMap(Map<String, dynamic> map) {
    return EvacuationItem(
      id: map['id'] as String,
      name: map['name'] as String,
      isChecked: map['isChecked'] as bool,
    );
  }

  /// Model → Map（shared_preferences 用）
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isChecked': isChecked,
    };
  }
}