import 'package:megaviz_chat/src/features/auth/application/providers/use_cases/get_auth_user_stream_use_case_provider.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_user_provider.g.dart';

@riverpod
class AuthUserProvider extends _$AuthUserProvider {
  @override
  Stream<AuthUser?> build() {
    final useCase = ref.watch(getAuthUserStreamUseCaseProvider);

    final stream = useCase();

    return stream;
  }
}

class MockAuthUserProvider extends _$AuthUserProvider
    with Mock
    implements AuthUserProvider {}
