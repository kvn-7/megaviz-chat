import 'package:megaviz_chat/src/features/auth/application/providers/repositories/auth_repository_provider.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/get_auth_user_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mockito/mockito.dart';

part 'get_auth_user_use_case_provider.g.dart';

@riverpod
class GetAuthUserUseCaseProvider extends _$GetAuthUserUseCaseProvider {
  @override
  GetAuthUserUseCase build() {
    return GetAuthUserUseCase(ref.read(authRepositoryProvider));
  }
}

class MockGetAuthUserUseCaseProvider extends _$GetAuthUserUseCaseProvider
    with Mock
    implements GetAuthUserUseCaseProvider {}
