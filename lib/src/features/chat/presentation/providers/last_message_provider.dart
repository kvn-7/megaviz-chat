import 'package:megaviz_chat/src/features/chat/application/providers/use_cases/get_last_message_stream_use_case_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'last_message_provider.g.dart';

@riverpod
class LastMessageProvider extends _$LastMessageProvider {
  @override
  Stream<ChatMessage?> build(String chatId) {
    final useCase = ref.watch(getLastMessageStreamUseCaseProvider);

    final result = useCase.call(chatId);

    return result.fold((failure) => Stream.error(failure), (res) => res);
  }
}
