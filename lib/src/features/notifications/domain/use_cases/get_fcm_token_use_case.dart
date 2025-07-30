import 'package:megaviz_chat/src/features/notifications/domain/repositories/notifications_repository.dart';

class GetFcmTokenUseCase {
  final INotificationsRepository _repo;

  GetFcmTokenUseCase(this._repo);

  Future<String?> call() async {
    return _repo.getFcmToken();
  }
}
