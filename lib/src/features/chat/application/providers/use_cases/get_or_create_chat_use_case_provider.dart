import 'package:megaviz_chat/src/features/chat/application/providers/repositories/chat_repository_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/use_cases/get_or_create_chat_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_or_create_chat_use_case_provider.g.dart';

@riverpod
class GetOrCreateChatUseCaseProvider extends _$GetOrCreateChatUseCaseProvider {
  @override
  GetOrCreateChatUseCase build() {
    return GetOrCreateChatUseCase(ref.read(chatRepositoryProvider));
  }
}
