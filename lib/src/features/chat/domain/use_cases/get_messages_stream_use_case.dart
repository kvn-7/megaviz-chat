import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:megaviz_chat/src/features/chat/domain/repositories/chat_repository.dart';

class GetMessagesStreamUseCase {
  final IChatRepository repo;
  GetMessagesStreamUseCase(this.repo);

  Either<AppException, Stream<List<ChatMessage>>> call(String chatId) =>
      repo.getMessagesStream(chatId);
}
