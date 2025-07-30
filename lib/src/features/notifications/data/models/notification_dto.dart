import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megaviz_chat/src/features/notifications/domain/entities/notification.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@freezed
abstract class SendNotificationDto with _$SendNotificationDto {
  const factory SendNotificationDto({
    required String recipientToken,
    required String senderName,
    required String messageContent,
    required String chatId,
  }) = _SendNotificationDto;

  factory SendNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$SendNotificationDtoFromJson(json);

  factory SendNotificationDto.fromDomain(SendNotification notification) {
    return SendNotificationDto(
      recipientToken: notification.recipientToken,
      senderName: notification.senderName,
      messageContent: notification.messageContent,
      chatId: notification.chatId,
    );
  }
}
