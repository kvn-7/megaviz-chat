import 'package:megaviz_chat/src/features/auth/application/providers/repositories/auth_repository_provider.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_out_use_case_provider.g.dart';

@riverpod
class SignOutUseCaseProvider extends _$SignOutUseCaseProvider {
  @override
  SignOutUseCase build() {
    return SignOutUseCase(ref.read(authRepositoryProvider));
  }
}
