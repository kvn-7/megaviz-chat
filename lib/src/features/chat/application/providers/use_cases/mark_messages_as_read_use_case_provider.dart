import 'package:megaviz_chat/src/features/chat/application/providers/repositories/chat_repository_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/use_cases/mark_messages_as_read_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mark_messages_as_read_use_case_provider.g.dart';

@riverpod
class MarkMessagesAsReadUseCaseProvider
    extends _$MarkMessagesAsReadUseCaseProvider {
  @override
  MarkMessagesAsReadUseCase build() {
    return MarkMessagesAsReadUseCase(ref.read(chatRepositoryProvider));
  }
}
