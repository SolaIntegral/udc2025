import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

/// チャットメッセージの種類
enum ChatMessageType {
  text, // テキストメッセージ
  template, // 定型文
  broadcast, // ブロードキャスト（地域掲示板）
}

/// チャットメッセージモデル
@freezed
class ChatMessageModel with _$ChatMessageModel {
  const factory ChatMessageModel({
    required String id,
    required String senderId, // 送信者のユーザーID
    required String senderName, // 送信者の名前
    required String content, // メッセージ内容
    required ChatMessageType type,
    required DateTime timestamp,
    String? roomId, // チャットルームID（1対1の場合は相手のID、グループの場合はグループID）
    String? translatedContent, // 翻訳後の内容
    String? originalLanguage, // 元の言語
    @Default(false) bool isRead, // 既読かどうか
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);
}

