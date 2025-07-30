import 'package:megaviz_chat/src/features/auth/application/providers/repositories/auth_repository_provider.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/sign_in_with_facebook_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_with_facebook_use_case_provider.g.dart';

@riverpod
class SignInWithFacebookUseCaseProvider
    extends _$SignInWithFacebookUseCaseProvider {
  @override
  SignInWithFacebookUseCase build() {
    return SignInWithFacebookUseCase(ref.watch(authRepositoryProvider));
  }
}
