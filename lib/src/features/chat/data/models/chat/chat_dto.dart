import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:megaviz_chat/src/utils/freezed/json_converts.dart';

part 'chat_dto.freezed.dart';
part 'chat_dto.g.dart';

@freezed
abstract class ChatDto with _$ChatDto {
  const factory ChatDto({required String id, required String userId}) =
      _ChatDto;

  factory ChatDto.fromJson(Map<String, dynamic> json) =>
      _$ChatDtoFromJson(json);
}

extension ChatDtoX on ChatDto {
  Chat toDomain() {
    return Chat(id: id, userId: userId);
  }
}

@freezed
abstract class ChatUserDto with _$ChatUserDto {
  const factory ChatUserDto({
    required String uid,
    required String displayName,
    String? photoURL,
  }) = _ChatUserDto;

  factory ChatUserDto.fromJson(Map<String, dynamic> json) =>
      _$ChatUserDtoFromJson(json);
}

extension ChatUserDtoX on ChatUserDto {
  ChatUser toDomain() {
    return ChatUser(id: uid, name: displayName, photoUrl: photoURL);
  }
}

@freezed
abstract class ChatMessageDto with _$ChatMessageDto {
  const factory ChatMessageDto({
    required String id,
    required String chatId,
    required ChatMessageContentDto content,
    @TimestampConverter() required DateTime timestamp,
    required String senderId,
  }) = _ChatMessageDto;

  factory ChatMessageDto.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageDtoFromJson(json);
}

extension ChatMessageDtoX on ChatMessageDto {
  ChatMessage toDomain() {
    return ChatMessage(
      id: id,
      chatId: chatId,
      content: content.toDomain(),
      timestamp: timestamp,
      senderId: senderId,
    );
  }
}

@freezed
sealed class ChatMessageContentDto with _$ChatMessageContentDto {
  const factory ChatMessageContentDto.text(String text) = TextContentDto;
  const factory ChatMessageContentDto.image(String imageUrl) = ImageContentDto;

  factory ChatMessageContentDto.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageContentDtoFromJson(json);

  factory ChatMessageContentDto.fromDomain(ChatMessageContent content) {
    return switch (content) {
      TextContent(text: final text) => TextContentDto(text),
      ImageContent(imageUrl: final imageUrl) => ImageContentDto(imageUrl),
    };
  }
}

extension ChatMessageContentDtoX on ChatMessageContentDto {
  ChatMessageContent toDomain() {
    return switch (this) {
      TextContentDto(text: final text) => ChatMessageContent.text(text),
      ImageContentDto(imageUrl: final imageUrl) => ChatMessageContent.image(
        imageUrl,
      ),
    };
  }
}

@freezed
abstract class SendMessageDto with _$SendMessageDto {
  const factory SendMessageDto({
    required String chatId,
    required ChatMessageContentDto content,
  }) = _SendMessageDto;

  factory SendMessageDto.fromJson(Map<String, dynamic> json) =>
      _$SendMessageDtoFromJson(json);

  factory SendMessageDto.fromDomain(SendMessage message) {
    return SendMessageDto(
      chatId: message.chatId,
      content: ChatMessageContentDto.fromDomain(message.content),
    );
  }
}

@freezed
abstract class SendMessageResDto with _$SendMessageResDto {
  const factory SendMessageResDto({
    required String chatId,
    required String messageId,
  }) = _SendMessageResDto;

  factory SendMessageResDto.fromJson(Map<String, dynamic> json) =>
      _$SendMessageResDtoFromJson(json);
}

extension SendMessageResDtoX on SendMessageResDto {
  SendMessageRes toDomain() {
    return SendMessageRes(chatId: chatId, messageId: messageId);
  }
}
