import 'dart:developer';

import 'package:megaviz_chat/src/features/chat/application/providers/use_cases/send_message_use_case_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:megaviz_chat/src/features/cloud_storage/application/providers/use_cases/upload_file_use_case_provider.dart';
import 'package:megaviz_chat/src/features/notifications/application/providers/use_cases/send_notification_use_case_provider.dart';
import 'package:megaviz_chat/src/features/notifications/domain/entities/notification.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_message_state_provider.g.dart';

@riverpod
class SendMessageStateProvider extends _$SendMessageStateProvider {
  @override
  Future<bool> build() async {
    return false;
  }

  Future<void> sendMessage(SendMessage message, ChatUser? user) async {
    state = const AsyncLoading();

    final useCase = ref.read(sendMessageUseCaseProvider);
    final result = await useCase(message);

    result.fold(
      (error) {
        state = AsyncError(error.message, StackTrace.current);
      },
      (res) async {
        state = const AsyncData(true);

        final recipientToken = user?.fcmToken;

        // Send push notification if recipient token is available
        if (recipientToken != null) {
          final senderName = user?.name;

          await _sendPushNotification(
            SendNotification(
              recipientToken: recipientToken,
              senderName: senderName ?? '',
              messageContent: _getMessageContent(message.content),
              chatId: message.chatId,
            ),
          );
        }
      },
    );
  }

  Future<void> sendImageMessage({
    required String filePath,
    required String chatId,
    required String destinationPath,
    required ChatUser? user,
  }) async {
    state = const AsyncLoading();

    final uploadImageUseCase = ref.read(uploadFileUseCaseProvider);

    final uploadResult = await uploadImageUseCase(filePath, destinationPath);

    uploadResult.fold(
      (error) {
        state = AsyncError(error.message, StackTrace.current);
      },
      (imageUrl) async {
        final message = SendMessage(
          chatId: chatId,
          content: ImageContent(imageUrl),
        );

        final useCase = ref.read(sendMessageUseCaseProvider);
        final result = await useCase(message);

        result.fold(
          (error) {
            state = AsyncError(error.message, StackTrace.current);
          },
          (res) {
            state = const AsyncData(true);

            final recipientToken = user?.fcmToken;

            // Send push notification if recipient token is available
            if (recipientToken != null) {
              final senderName = user?.name;
              _sendPushNotification(
                SendNotification(
                  chatId: chatId,
                  recipientToken: recipientToken,
                  senderName: senderName ?? '',
                  messageContent: '📷 Image',
                ),
              );
            }
          },
        );
      },
    );
  }

  Future<void> _sendPushNotification(SendNotification notification) async {
    final sendNotificationUseCase = ref.read(sendNotificationUseCaseProvider);
    final result = await sendNotificationUseCase(notification);

    result.fold((error) {
      log(
        'Failed to send notification: ${error.message}',
        name: 'SendMessageStateProvider',
      );
    }, (success) {});
  }

  String _getMessageContent(ChatMessageContent content) {
    if (content is TextContent) {
      return content.text;
    } else if (content is ImageContent) {
      return '📷 Image';
    }
    return 'New message';
  }
}
