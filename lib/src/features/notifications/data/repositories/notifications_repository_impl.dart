import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/notifications/data/models/notification_dto.dart';
import 'package:megaviz_chat/src/features/notifications/domain/entities/notification.dart';
import 'package:megaviz_chat/src/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:megaviz_chat/src/features/notifications/data/sources/firebase_cloud_messaging_data_source.dart';

class NotificationsRepository implements INotificationsRepository {
  final FirebaseCloudMessagingDataSource _dataSource;

  NotificationsRepository(this._dataSource);

  @override
  Future<String?> getFcmToken() async {
    return _dataSource.getFcmToken();
  }

  @override
  Future<Either<AppException, bool>> sendNotification(
    SendNotification notification,
  ) async {
    return _dataSource.sendPushNotification(
      SendNotificationDto.fromDomain(notification),
    );
  }
}
