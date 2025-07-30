import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

@freezed
abstract class SendNotification with _$SendNotification {
  const factory SendNotification({
    required String recipientToken,
    required String senderName,
    required String messageContent,
    required String chatId,
  }) = _SendNotification;
}
