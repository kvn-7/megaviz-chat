import 'package:megaviz_chat/src/features/chat/data/sources/chat_remote_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_remote_data_source_provider.g.dart';

@riverpod
class ChatRemoteDataSourceProvider extends _$ChatRemoteDataSourceProvider {
  @override
  ChatRemoteDataSource build() {
    return ChatRemoteDataSource();
  }
}
