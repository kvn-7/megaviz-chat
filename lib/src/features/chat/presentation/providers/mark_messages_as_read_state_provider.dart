import 'package:megaviz_chat/src/features/chat/application/providers/use_cases/mark_messages_as_read_use_case_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mark_messages_as_read_state_provider.g.dart';

@riverpod
class MarkMessagesAsReadStateProvider
    extends _$MarkMessagesAsReadStateProvider {
  @override
  Future<bool> build() async {
    return false;
  }

  Future<void> markAsRead(String chatId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    state = const AsyncLoading();

    final useCase = ref.read(markMessagesAsReadUseCaseProvider);
    final result = await useCase(chatId);

    result.fold(
      (error) {
        state = AsyncError(error.message, StackTrace.current);
      },
      (user) {
        state = const AsyncData(true);
      },
    );
  }
}
