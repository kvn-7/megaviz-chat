import 'package:megaviz_chat/src/features/notifications/application/providers/repositories/notifications_repository_provider.dart';
import 'package:megaviz_chat/src/features/notifications/domain/use_cases/send_notification_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_notification_use_case_provider.g.dart';

@riverpod
class SendNotificationUseCaseProvider
    extends _$SendNotificationUseCaseProvider {
  @override
  SendNotificationUseCase build() {
    return SendNotificationUseCase(ref.watch(notificationsRepositoryProvider));
  }
}
