import 'package:megaviz_chat/src/features/chat/application/providers/use_cases/get_available_chat_users_stream_use_case_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'available_chat_users_provider.g.dart';

@riverpod
class AvailableChatUsersProvider extends _$AvailableChatUsersProvider {
  @override
  Stream<List<ChatUser>> build() {
    final useCase = ref.watch(getAvailableChatUsersStreamUseCaseProvider);

    final result = useCase.call();

    return result.fold((left) => Stream.error(left), (right) => right);
  }
}
