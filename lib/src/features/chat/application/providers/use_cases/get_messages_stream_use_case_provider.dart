import 'package:megaviz_chat/src/features/chat/application/providers/repositories/chat_repository_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/use_cases/get_messages_stream_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_messages_stream_use_case_provider.g.dart';

@riverpod
class GetMessagesStreamUseCaseProvider
    extends _$GetMessagesStreamUseCaseProvider {
  @override
  GetMessagesStreamUseCase build() {
    return GetMessagesStreamUseCase(ref.read(chatRepositoryProvider));
  }
}
