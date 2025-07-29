import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/chat/domain/repositories/chat_repository.dart';

class MarkMessagesAsReadUseCase {
  final IChatRepository repo;
  MarkMessagesAsReadUseCase(this.repo);

  Future<Either<AppException, void>> call(String chatId) =>
      repo.markMessagesAsRead(chatId);
}
