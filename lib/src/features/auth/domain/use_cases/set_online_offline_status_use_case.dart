import 'package:megaviz_chat/src/features/auth/domain/repositories/auth_repository.dart';

class SetOnlineOfflineStatusUseCase {
  final IAuthRepository repo;
  SetOnlineOfflineStatusUseCase(this.repo);

  Future<void> call(bool isOnline) => repo.setOnlineOffline(isOnline);
}
