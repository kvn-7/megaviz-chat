import 'package:megaviz_chat/src/features/chat/application/providers/repositories/chat_repository_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/use_cases/get_last_message_stream_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_last_message_stream_use_case_provider.g.dart';

@riverpod
class GetLastMessageStreamUseCaseProvider
    extends _$GetLastMessageStreamUseCaseProvider {
  @override
  GetLastMessageStreamUseCase build() {
    return GetLastMessageStreamUseCase(ref.read(chatRepositoryProvider));
  }
}
