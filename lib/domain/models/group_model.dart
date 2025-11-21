import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_model.freezed.dart';
part 'group_model.g.dart';

/// 信頼できるグループモデル
@freezed
class GroupModel with _$GroupModel {
  const factory GroupModel({
    required String id,
    required String name,
    required List<String> memberIds, // メンバーのユーザーIDリスト
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _GroupModel;

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);
}

