// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageModelImpl _$$ChatMessageModelImplFromJson(
  Map<String, dynamic> json,
) => _$ChatMessageModelImpl(
  id: json['id'] as String,
  senderId: json['senderId'] as String,
  senderName: json['senderName'] as String,
  content: json['content'] as String,
  type: $enumDecode(_$ChatMessageTypeEnumMap, json['type']),
  timestamp: DateTime.parse(json['timestamp'] as String),
  roomId: json['roomId'] as String?,
  translatedContent: json['translatedContent'] as String?,
  originalLanguage: json['originalLanguage'] as String?,
  isRead: json['isRead'] as bool? ?? false,
);

Map<String, dynamic> _$$ChatMessageModelImplToJson(
  _$ChatMessageModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'senderId': instance.senderId,
  'senderName': instance.senderName,
  'content': instance.content,
  'type': _$ChatMessageTypeEnumMap[instance.type]!,
  'timestamp': instance.timestamp.toIso8601String(),
  'roomId': instance.roomId,
  'translatedContent': instance.translatedContent,
  'originalLanguage': instance.originalLanguage,
  'isRead': instance.isRead,
};

const _$ChatMessageTypeEnumMap = {
  ChatMessageType.text: 'text',
  ChatMessageType.template: 'template',
  ChatMessageType.broadcast: 'broadcast',
};
