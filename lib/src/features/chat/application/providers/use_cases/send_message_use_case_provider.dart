import 'package:megaviz_chat/src/features/chat/application/providers/repositories/chat_repository_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/use_cases/send_message_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_message_use_case_provider.g.dart';

@riverpod
class SendMessageUseCaseProvider extends _$SendMessageUseCaseProvider {
  @override
  SendMessageUseCase build() {
    return SendMessageUseCase(ref.watch(chatRepositoryProvider));
  }
}
