import 'package:megaviz_chat/src/features/chat/application/providers/use_cases/get_messages_stream_use_case_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messages_provider.g.dart';

@riverpod
class MessagesProvider extends _$MessagesProvider {
  @override
  Stream<List<ChatMessage>> build(String chatId) {
    final useCase = ref.watch(getMessagesStreamUseCaseProvider);

    final result = useCase.call(chatId);

    return result.fold((failure) => Stream.error(failure), (res) => res);
  }
}
