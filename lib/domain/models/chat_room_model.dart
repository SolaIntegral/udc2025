import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

/// チャットルームの種類
enum ChatRoomType {
  oneOnOne, // 1対1
  group, // グループ
  broadcast, // ブロードキャスト（地域掲示板）
}

/// チャットルームモデル
@freezed
class ChatRoomModel with _$ChatRoomModel {
  const factory ChatRoomModel({
    required String id,
    required String name, // ルーム名
    required ChatRoomType type,
    required List<String> memberIds, // メンバーのIDリスト
    String? lastMessage, // 最後のメッセージ
    DateTime? lastMessageAt, // 最後のメッセージ時刻
    @Default(0) int unreadCount, // 未読数
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);
}

