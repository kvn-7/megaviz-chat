import 'package:megaviz_chat/src/features/chat/application/providers/repositories/chat_repository_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/use_cases/get_chat_user_stream_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_chat_user_stream_use_case_provider.g.dart';

@riverpod
class GetChatUserStreamUseCaseProvider
    extends _$GetChatUserStreamUseCaseProvider {
  @override
  GetChatUserStreamUseCase build() {
    return GetChatUserStreamUseCase(ref.read(chatRepositoryProvider));
  }
}
