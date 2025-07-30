import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:megaviz_chat/src/features/auth/domain/repositories/auth_repository.dart';

class GetAuthUserStreamUseCase {
  final IAuthRepository repo;
  GetAuthUserStreamUseCase(this.repo);

  Stream<AuthUser?> call() => repo.getAuthUserStream();
}
