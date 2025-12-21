import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'nearby_user_model.freezed.dart';
part 'nearby_user_model.g.dart';

/// 周辺ユーザーモデル
/// レーダー画面で表示する周辺のユーザー情報
@freezed
class NearbyUserModel with _$NearbyUserModel {
  const factory NearbyUserModel({
    required UserModel user,
    required double distance, // 距離（メートル）
    required DateTime discoveredAt, // 発見時刻
    @Default(false) bool isTrustedGroupMember, // 信頼グループのメンバーか
  }) = _NearbyUserModel;

  factory NearbyUserModel.fromJson(Map<String, dynamic> json) =>
      _$NearbyUserModelFromJson(json);
}

