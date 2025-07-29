import 'package:megaviz_chat/src/features/chat/application/providers/sources/chat_remote_data_source_provider.dart';
import 'package:megaviz_chat/src/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:megaviz_chat/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_repository_provider.g.dart';

@riverpod
class ChatRepositoryProvider extends _$ChatRepositoryProvider {
  @override
  IChatRepository build() {
    return ChatRepositoryImpl(ref.watch(chatRemoteDataSourceProvider));
  }
}
