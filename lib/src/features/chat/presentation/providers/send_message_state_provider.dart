import 'package:megaviz_chat/src/features/chat/application/providers/use_cases/send_message_use_case_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_message_state_provider.g.dart';

@riverpod
class SendMessageStateProvider extends _$SendMessageStateProvider {
  @override
  Future<bool> build() async {
    return false;
  }

  Future<void> sendMessage(SendMessage message) async {
    state = const AsyncLoading();

    final useCase = ref.read(sendMessageUseCaseProvider);
    final result = await useCase(message);

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
