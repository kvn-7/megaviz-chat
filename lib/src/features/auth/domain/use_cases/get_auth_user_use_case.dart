import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:megaviz_chat/src/features/auth/domain/repositories/auth_repository.dart';

class GetAuthUserUseCase {
  final IAuthRepository repo;
  GetAuthUserUseCase(this.repo);

  Future<AuthUser?> call() => repo.getAuthUser();
}
