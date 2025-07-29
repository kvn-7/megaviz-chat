// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatDto _$ChatDtoFromJson(Map<String, dynamic> json) =>
    _ChatDto(id: json['id'] as String, userId: json['userId'] as String);

Map<String, dynamic> _$ChatDtoToJson(_ChatDto instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
};

_ChatUserDto _$ChatUserDtoFromJson(Map<String, dynamic> json) => _ChatUserDto(
  uid: json['uid'] as String,
  displayName: json['displayName'] as String,
  photoURL: json['photoURL'] as String?,
);

Map<String, dynamic> _$ChatUserDtoToJson(_ChatUserDto instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      if (instance.photoURL case final value?) 'photoURL': value,
    };

_ChatMessageDto _$ChatMessageDtoFromJson(Map<String, dynamic> json) =>
    _ChatMessageDto(
      id: json['id'] as String,
      chatId: json['chatId'] as String,
      content: ChatMessageContentDto.fromJson(
        json['content'] as Map<String, dynamic>,
      ),
      timestamp: const TimestampConverter().fromJson(json['timestamp']),
      senderId: json['senderId'] as String,
      isRead: json['isRead'] as bool? ?? false,
    );

Map<String, dynamic> _$ChatMessageDtoToJson(
  _ChatMessageDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'chatId': instance.chatId,
  'content': instance.content,
  if (const TimestampConverter().toJson(instance.timestamp) case final value?)
    'timestamp': value,
  'senderId': instance.senderId,
  'isRead': instance.isRead,
};

TextContentDto _$TextContentDtoFromJson(Map<String, dynamic> json) =>
    TextContentDto(json['text'] as String, $type: json['type'] as String?);

Map<String, dynamic> _$TextContentDtoToJson(TextContentDto instance) =>
    <String, dynamic>{'text': instance.text, 'type': instance.$type};

ImageContentDto _$ImageContentDtoFromJson(Map<String, dynamic> json) =>
    ImageContentDto(json['imageUrl'] as String, $type: json['type'] as String?);

Map<String, dynamic> _$ImageContentDtoToJson(ImageContentDto instance) =>
    <String, dynamic>{'imageUrl': instance.imageUrl, 'type': instance.$type};

_SendMessageDto _$SendMessageDtoFromJson(Map<String, dynamic> json) =>
    _SendMessageDto(
      chatId: json['chatId'] as String,
      content: ChatMessageContentDto.fromJson(
        json['content'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SendMessageDtoToJson(_SendMessageDto instance) =>
    <String, dynamic>{'chatId': instance.chatId, 'content': instance.content};

_SendMessageResDto _$SendMessageResDtoFromJson(Map<String, dynamic> json) =>
    _SendMessageResDto(
      chatId: json['chatId'] as String,
      messageId: json['messageId'] as String,
    );

Map<String, dynamic> _$SendMessageResDtoToJson(_SendMessageResDto instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'messageId': instance.messageId,
    };
