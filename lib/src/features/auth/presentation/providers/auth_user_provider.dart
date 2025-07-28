import 'package:megaviz_chat/src/features/auth/application/providers/use_cases/get_auth_user_stream_use_case_provider.dart';
import 'package:megaviz_chat/src/features/auth/application/providers/use_cases/get_auth_user_use_case_provider.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_user_provider.g.dart';

@riverpod
class AuthUserProvider extends _$AuthUserProvider {
  @override
  Future<AuthUser?> build() async {
    final useCase = ref.watch(getAuthUserUseCaseProvider);

    final authUser = await useCase();

    listenToAuthUserStream();

    return authUser;
  }

  void listenToAuthUserStream() async {
    await Future.delayed(const Duration(milliseconds: 100));

    final useCase = ref.watch(getAuthUserStreamUseCaseProvider);

    useCase().listen((authUser) {
      state = AsyncValue.data(authUser);
    });
  }
}
