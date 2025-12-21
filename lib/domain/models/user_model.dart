import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// ユーザーステータス
enum UserStatus {
  ok, // 無事・支援可能
  sos, // 支援が必要
  unknown, // 不明
}

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
    // コミュニティ機能用の拡張フィールド
    String? nationality, // 国籍
    String? religiousConsiderations, // 宗教的配慮（ハラールなど）
    List<String>? needs, // 支援が必要な事項（持病、妊娠中など）
    List<String>? skills, // スキルリスト（「力仕事ができます」「応急処置ができます」など）
    @Default(UserStatus.unknown) UserStatus status, // 現在のステータス
    @Default(100) int batteryLevel, // バッテリー残量（%）
    double? latitude, // 現在位置（緯度）
    double? longitude, // 現在位置（経度）
    DateTime? lastSeenAt, // 最終確認時刻
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

