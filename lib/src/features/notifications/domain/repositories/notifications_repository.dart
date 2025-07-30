import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/notifications/domain/entities/notification.dart';

abstract class INotificationsRepository {
  Future<String?> getFcmToken();
  Future<Either<AppException, bool>> sendNotification(
    SendNotification notification,
  );
}
