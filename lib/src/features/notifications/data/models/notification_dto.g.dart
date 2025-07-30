// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SendNotificationDto _$SendNotificationDtoFromJson(Map<String, dynamic> json) =>
    _SendNotificationDto(
      recipientToken: json['recipientToken'] as String,
      senderName: json['senderName'] as String,
      messageContent: json['messageContent'] as String,
      chatId: json['chatId'] as String,
    );

Map<String, dynamic> _$SendNotificationDtoToJson(
  _SendNotificationDto instance,
) => <String, dynamic>{
  'recipientToken': instance.recipientToken,
  'senderName': instance.senderName,
  'messageContent': instance.messageContent,
  'chatId': instance.chatId,
};
