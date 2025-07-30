import 'package:megaviz_chat/src/features/notifications/application/providers/sources/firebase_cloud_messaging_data_source_provider.dart';
import 'package:megaviz_chat/src/features/notifications/data/repositories/notifications_repository.dart';
import 'package:megaviz_chat/src/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_repository_provider.g.dart';

@riverpod
class NotificationsRepositoryProvider
    extends _$NotificationsRepositoryProvider {
  @override
  INotificationsRepository build() {
    return NotificationsRepository(
      ref.read(firebaseCloudMessagingDataSourceProvider),
    );
  }
}
