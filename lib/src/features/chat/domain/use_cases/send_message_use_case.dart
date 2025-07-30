import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:megaviz_chat/src/features/chat/domain/repositories/chat_repository.dart';

class SendMessageUseCase {
  final IChatRepository repo;
  SendMessageUseCase(this.repo);

  Future<Either<AppException, SendMessageRes>> call(SendMessage message) =>
      repo.sendMessage(message);
}
