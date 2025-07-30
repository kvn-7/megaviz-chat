import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:megaviz_chat/src/features/chat/domain/repositories/chat_repository.dart';

class GetAvailableChatUsersStreamUseCase {
  final IChatRepository repo;
  GetAvailableChatUsersStreamUseCase(this.repo);

  Either<AppException, Stream<List<ChatUser>>> call() =>
      repo.getAvailableChatUsersStream();
}
