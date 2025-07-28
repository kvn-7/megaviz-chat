import 'package:megaviz_chat/src/features/auth/application/providers/repositories/auth_repository_provider.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/get_auth_user_stream_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_auth_user_stream_use_case_provider.g.dart';

@riverpod
class GetAuthUserStreamUseCaseProvider
    extends _$GetAuthUserStreamUseCaseProvider {
  @override
  GetAuthUserStreamUseCase build() {
    return GetAuthUserStreamUseCase(ref.watch(authRepositoryProvider));
  }
}
