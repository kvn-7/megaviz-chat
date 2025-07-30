import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/chat/data/models/chat/chat_dto.dart';
import 'package:megaviz_chat/src/features/chat/data/sources/chat_remote_data_source.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:megaviz_chat/src/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements IChatRepository {
  final ChatRemoteDataSource _remoteDataSource;

  ChatRepositoryImpl(this._remoteDataSource);

  @override
  Either<AppException, Stream<ChatUser?>> getChatUserStream(String userId) {
    return _remoteDataSource
        .getChatUserStream(userId)
        .mapRight((dto) => dto.map((e) => e?.toDomain()));
  }

  @override
  Either<AppException, Stream<List<Chat>>> getChatsStream() {
    return _remoteDataSource.getChatsStream().mapRight(
      (dto) => dto.map((e) => e.map((chat) => chat.toDomain()).toList()),
    );
  }

  @override
  Either<AppException, Stream<ChatMessage?>> getLastMessageStream(
    String chatId,
  ) {
    return _remoteDataSource
        .getLastMessageStream(chatId)
        .mapRight((dto) => dto.map((e) => e?.toDomain()));
  }

  @override
  Future<Either<AppException, SendMessageRes>> sendMessage(
    SendMessage message,
  ) async {
    final response = await _remoteDataSource.sendMessage(
      SendMessageDto.fromDomain(message),
    );

    return response.mapRight((dto) => dto.toDomain());
  }

  @override
  Either<AppException, Stream<List<ChatUser>>> getAvailableChatUsersStream() {
    return _remoteDataSource.getAvailableChatUsersStream().mapRight(
      (dto) =>
          dto.map((e) => e.map((chatUser) => chatUser.toDomain()).toList()),
    );
  }

  @override
  Future<Either<AppException, Chat>> getOrCreateChat(String userId) async {
    final response = await _remoteDataSource.getOrCreateChat(userId);

    return response.mapRight((dto) => dto.toDomain());
  }

  @override
  Either<AppException, Stream<List<ChatMessage>>> getMessagesStream(
    String chatId,
  ) {
    return _remoteDataSource.getMessagesStream(chatId).mapRight((dto) {
      return dto.map(
        (e) => e.map((message) {
          return message.toDomain();
        }).toList(),
      );
    });
  }

  @override
  Future<Either<AppException, void>> markMessagesAsRead(String chatId) async {
    final response = await _remoteDataSource.markMessagesAsRead(chatId);

    return response.mapRight((_) {});
  }
}
