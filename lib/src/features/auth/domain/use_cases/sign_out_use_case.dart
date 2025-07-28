import 'package:megaviz_chat/src/features/auth/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  final IAuthRepository repo;
  SignOutUseCase(this.repo);

  Future<void> call() => repo.signOut();
}
