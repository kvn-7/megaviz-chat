import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:megaviz_chat/src/features/auth/domain/repositories/auth_repository.dart';

class SignInWithFacebookUseCase {
  final IAuthRepository repo;
  SignInWithFacebookUseCase(this.repo);

  Future<Either<AppException, AuthUser>> call(String? fcmToken) =>
      repo.signInWithFacebook(fcmToken);
}
