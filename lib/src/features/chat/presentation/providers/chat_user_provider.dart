import 'package:megaviz_chat/src/features/chat/application/providers/use_cases/get_chat_user_stream_use_case_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_user_provider.g.dart';

@riverpod
class ChatUserProvider extends _$ChatUserProvider {
  @override
  Stream<ChatUser?> build(String userId) {
    final useCase = ref.watch(getChatUserStreamUseCaseProvider);

    final result = useCase(userId);

    return result.fold((failure) => Stream.error(failure), (stream) => stream);
  }
}
