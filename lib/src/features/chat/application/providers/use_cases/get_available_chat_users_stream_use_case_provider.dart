import 'package:megaviz_chat/src/features/chat/application/providers/repositories/chat_repository_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/use_cases/get_available_chat_users_stream_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_available_chat_users_stream_use_case_provider.g.dart';

@riverpod
class GetAvailableChatUsersStreamUseCaseProvider
    extends _$GetAvailableChatUsersStreamUseCaseProvider {
  @override
  GetAvailableChatUsersStreamUseCase build() {
    return GetAvailableChatUsersStreamUseCase(
      ref.watch(chatRepositoryProvider),
    );
  }
}
