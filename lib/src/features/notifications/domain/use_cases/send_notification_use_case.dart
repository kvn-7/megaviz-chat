import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/notifications/domain/entities/notification.dart';
import 'package:megaviz_chat/src/features/notifications/domain/repositories/notifications_repository.dart';

class SendNotificationUseCase {
  final INotificationsRepository _repo;

  SendNotificationUseCase(this._repo);

  Future<Either<AppException, bool>> call(SendNotification notification) {
    return _repo.sendNotification(notification);
  }
}
