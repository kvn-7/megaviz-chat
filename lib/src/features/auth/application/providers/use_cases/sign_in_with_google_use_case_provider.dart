import 'package:megaviz_chat/src/features/auth/application/providers/repositories/auth_repository_provider.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_with_google_use_case_provider.g.dart';

@riverpod
class SignInWithGoogleUseCaseProvider
    extends _$SignInWithGoogleUseCaseProvider {
  @override
  SignInWithGoogleUseCase build() {
    return SignInWithGoogleUseCase(ref.read(authRepositoryProvider));
  }
}
