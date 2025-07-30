import 'package:megaviz_chat/src/features/auth/application/providers/use_cases/sign_in_with_facebook_use_case_provider.dart';
import 'package:megaviz_chat/src/features/auth/application/providers/use_cases/sign_in_with_google_use_case_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_state_provider.g.dart';

@riverpod
class SignInStateProvider extends _$SignInStateProvider {
  @override
  Future<bool> build() async {
    return false;
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();

    final useCase = ref.read(signInWithGoogleUseCaseProvider);
    final result = await useCase();

    result.fold(
      (error) {
        state = AsyncError(error.message, StackTrace.current);
      },
      (user) {
        state = const AsyncData(true);
      },
    );
  }

  Future<void> signInWithFacebook() async {
    state = const AsyncLoading();

    final useCase = ref.read(signInWithFacebookUseCaseProvider);
    final result = await useCase();

    result.fold(
      (error) {
        state = AsyncError(error.message, StackTrace.current);
      },
      (user) {
        state = const AsyncData(true);
      },
    );
  }
}

class MockSignInStateProvider extends _$SignInStateProvider
    with Mock
    implements SignInStateProvider {}
