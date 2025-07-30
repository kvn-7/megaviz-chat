import 'package:megaviz_chat/src/features/auth/application/providers/sources/firebase_auth_data_source_provider.dart';
import 'package:megaviz_chat/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:megaviz_chat/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

@riverpod
class AuthRepositoryProvider extends _$AuthRepositoryProvider {
  @override
  IAuthRepository build() {
    return AuthRepositoryImpl(ref.watch(firebaseAuthDataSourceProvider));
  }
}
