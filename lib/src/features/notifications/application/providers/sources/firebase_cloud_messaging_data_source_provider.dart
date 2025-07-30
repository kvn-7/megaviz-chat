import 'package:megaviz_chat/src/features/notifications/data/sources/firebase_cloud_messaging_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_cloud_messaging_data_source_provider.g.dart';

@riverpod
class FirebaseCloudMessagingDataSourceProvider
    extends _$FirebaseCloudMessagingDataSourceProvider {
  @override
  FirebaseCloudMessagingDataSource build() {
    return FirebaseCloudMessagingDataSource();
  }
}
