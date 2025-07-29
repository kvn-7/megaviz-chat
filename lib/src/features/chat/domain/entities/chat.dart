import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';

@freezed
abstract class Chat with _$Chat {
  const factory Chat({required String id, required String userId}) = _Chat;
}

@freezed
abstract class ChatUser with _$ChatUser {
  const factory ChatUser({
    required String id,
    required String name,
    String? photoUrl,
  }) = _ChatUser;
}

@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required String chatId,
    required ChatMessageContent content,
    required DateTime timestamp,
    required String senderId,
  }) = _ChatMessage;
}

@freezed
sealed class ChatMessageContent with _$ChatMessageContent {
  const factory ChatMessageContent.text(String text) = TextContent;
  const factory ChatMessageContent.image(String imageUrl) = ImageContent;
}

@freezed
abstract class SendMessage with _$SendMessage {
  const factory SendMessage({
    required String chatId,
    required ChatMessageContent content,
  }) = _SendMessage;
}

@freezed
abstract class SendMessageRes with _$SendMessageRes {
  const factory SendMessageRes({
    required String chatId,
    required String messageId,
  }) = _SendMessageRes;
}
