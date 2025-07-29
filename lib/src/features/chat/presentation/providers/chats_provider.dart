import 'package:megaviz_chat/src/features/chat/application/providers/use_cases/get_chats_stream_use_case_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chats_provider.g.dart';

@riverpod
class ChatsProvider extends _$ChatsProvider {
  @override
  Stream<List<Chat>> build() {
    final useCase = ref.watch(getChatsStreamUseCaseProvider);

    final result = useCase.call();

    return result.fold((failure) => Stream.error(failure), (res) => res);
  }
}
