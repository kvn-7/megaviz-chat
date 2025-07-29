import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';

abstract class IChatRepository {
  Either<AppException, Stream<List<Chat>>> getChatsStream();
  Either<AppException, Stream<ChatMessage?>> getLastMessageStream(
    String chatId,
  );
  Either<AppException, Stream<ChatUser?>> getChatUserStream(String userId);
  Future<Either<AppException, SendMessageRes>> sendMessage(SendMessage message);
  Either<AppException, Stream<List<ChatUser>>> getAvailableChatUsersStream();
  Future<Either<AppException, Chat>> getOrCreateChat(String userId);
}
