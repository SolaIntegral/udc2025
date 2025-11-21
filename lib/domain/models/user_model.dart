import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// ユーザーモデル
/// ユーザーID, 名前, 使用言語, 属性（避難弱者など）を持つ
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    @Default('ja') String language, // デフォルトは日本語
    @Default(false) bool isVulnerable, // 避難弱者フラグ
    String? profileImageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

