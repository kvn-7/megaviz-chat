import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';

abstract class IAuthRepository {
  Future<Either<AppException, AuthUser>> signInWithGoogle();

  Future<Either<AppException, AuthUser>> signInWithFacebook();

  Future<AuthUser?> getAuthUser();

  Stream<AuthUser?> getAuthUserStream();

  Future<void> signOut();

  Future<void> setOnlineOffline(bool isOnline);
}
