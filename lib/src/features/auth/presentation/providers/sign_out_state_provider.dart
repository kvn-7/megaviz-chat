import 'package:megaviz_chat/src/features/auth/application/providers/use_cases/sign_out_use_case_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_out_state_provider.g.dart';

@riverpod
class SignOutStateProvider extends _$SignOutStateProvider {
  @override
  Future<bool> build() async {
    return false;
  }

  Future<void> signOut() async {
    state = const AsyncLoading();

    final useCase = ref.read(signOutUseCaseProvider);

    await useCase();

    state = const AsyncData(true);
  }
}

class MockSignOutStateProvider extends _$SignOutStateProvider
    with Mock
    implements SignOutStateProvider {}
