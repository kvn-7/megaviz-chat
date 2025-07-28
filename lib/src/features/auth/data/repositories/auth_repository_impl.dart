import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/auth/data/models/auth_user/auth_user_dto.dart';
import 'package:megaviz_chat/src/features/auth/data/sources/firebase_auth_data_source.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:megaviz_chat/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final FirebaseAuthDatasource _firebaseAuthDatasource;

  AuthRepositoryImpl(this._firebaseAuthDatasource);

  @override
  Future<Either<AppException, AuthUser>> signInWithGoogle() async {
    final response = await _firebaseAuthDatasource.signInWithGoogle();

    return response.mapRight((model) => model.toDomain());
  }

  @override
  Future<AuthUser?> getAuthUser() async {
    final user = _firebaseAuthDatasource.currentUser;

    return user?.toDomain();
  }

  @override
  Stream<AuthUser?> getAuthUserStream() {
    return _firebaseAuthDatasource.userChanges.map((user) {
      return user?.toDomain();
    });
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuthDatasource.signOut();
  }
}
