import 'package:megaviz_chat/src/features/chat/application/providers/use_cases/get_or_create_chat_use_case_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_chat_provider.g.dart';

@riverpod
class UserChatProvider extends _$UserChatProvider {
  @override
  Future<Chat> build(String userId) async {
    final useCase = ref.watch(getOrCreateChatUseCaseProvider);

    final result = await useCase(userId);

    return result.fold((failure) => throw failure, (res) => res);
  }
}
