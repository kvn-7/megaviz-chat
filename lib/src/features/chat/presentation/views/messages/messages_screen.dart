import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_icon.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_image.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_loader.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_scaffold.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text_field.dart';
import 'package:megaviz_chat/src/features/auth/presentation/providers/auth_user_provider.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:megaviz_chat/src/features/chat/presentation/providers/chat_user_provider.dart';
import 'package:megaviz_chat/src/features/chat/presentation/providers/mark_messages_as_read_state_provider.dart';
import 'package:megaviz_chat/src/features/chat/presentation/providers/messages_provider.dart';
import 'package:megaviz_chat/src/features/chat/presentation/providers/send_message_state_provider.dart';
import 'package:megaviz_chat/src/features/chat/presentation/views/messages/widgets/my_message_widget.dart';
import 'package:megaviz_chat/src/features/chat/presentation/views/messages/widgets/others_message_widget.dart';
import 'package:megaviz_chat/src/features/media/presentation/providers/app_media_utils_provider.dart';
import 'package:megaviz_chat/src/utils/assets/app_assets.dart';
import 'package:megaviz_chat/src/utils/extensions/app_date_time_extension.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class MessagesScreen extends HookConsumerWidget {
  const MessagesScreen({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    final sending = useState(false);
    final uploadingImage = useState(false);

    ref.listen(messagesProvider(chat.id), (previous, next) {
      if (next.hasValue) {
        ref.read(markMessagesAsReadStateProvider.notifier).markAsRead(chat.id);
      }
    });

    useEffect(() {
      ref.read(markMessagesAsReadStateProvider.notifier).markAsRead(chat.id);
      return null;
    }, []);

    Widget msgTextField() {
      return AppTextField(
        textInputAction: TextInputAction.newline,
        controller: controller,
        hintText: context.appLocalizations.typeMessage,
        maxLines: 8,
        maxLength: 1000,
        minLines: 1,
      );
    }

    Future<void> sendPressed() async {
      final text = controller.text.trim();

      if (text.isEmpty) return;

      if (sending.value) return;

      sending.value = true;

      ref
          .read(sendMessageStateProvider.notifier)
          .sendMessage(
            SendMessage(chatId: chat.id, content: TextContent(text)),
            ref.watch(chatUserProvider(chat.userId)).valueOrNull,
          );

      sending.value = false;

      controller.clear();
    }

    Future<void> pickAndSendImage() async {
      if (uploadingImage.value) return;

      try {
        uploadingImage.value = true;

        final mediaUtils = ref.read(appMediaUtilsProvider);
        final pickedImage = await mediaUtils.pickImage();

        if (pickedImage != null) {
          // Generate a unique filename for the image
          final timestamp = DateTime.now().millisecondsSinceEpoch;
          final fileName = 'chat_image_$timestamp.jpg';
          final destinationPath = 'chat_images/${chat.id}/$fileName';

          await ref
              .read(sendMessageStateProvider.notifier)
              .sendImageMessage(
                filePath: pickedImage.path,
                chatId: chat.id,
                destinationPath: destinationPath,
                user: ref.watch(chatUserProvider(chat.userId)).valueOrNull,
              );
        }
      } catch (e) {
        log('Error picking image: $e');
      } finally {
        uploadingImage.value = false;
      }
    }

    return AppScaffold(
      padding: EdgeInsets.zero,
      appBar: AppBar(
        titleSpacing: 0,
        title: ref
            .watch(chatUserProvider(chat.userId))
            .when(
              data: (user) {
                if (user == null) return const SizedBox.shrink();

                return Row(
                  children: [
                    AppImage.network(
                      url: user.photoUrl,
                      height: 48,
                      width: 48,
                      radius: BorderRadius.circular(100),
                    ),
                    AppSpaces.h8,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: user.name,
                            style: context.textTheme.titleMedium,
                          ),
                          AppSpaces.v4,
                          AppText(
                            text: user.isOnline
                                ? context.appLocalizations.online
                                : context.appLocalizations.lastSeen(
                                    user.lastSeen?.verboseTimeOrDate ?? '',
                                  ),
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              error: (error, stackTrace) => null,
              loading: () => null,
            ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ref
                .watch(messagesProvider(chat.id))
                .when(
                  skipLoadingOnRefresh: true,
                  skipLoadingOnReload: true,
                  data: (res) {
                    final messages = res.toList();

                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final originalMessages = res.toList();

                          final msg = messages[index];

                          final sameDate = isSameDate(
                            msg: msg,
                            messages: originalMessages,
                            index: index,
                          );

                          final sameUser = isSameUser(
                            msg: msg,
                            messages: originalMessages,
                            index: index,
                          );

                          final userId = ref
                              .read(authUserProvider)
                              .valueOrNull
                              ?.id;

                          final myMessage = msg.senderId == userId;

                          if (myMessage) {
                            return MyMessageWidget(
                              message: msg,
                              sameDate: sameDate,
                              sameUser: sameUser,
                            );
                          }

                          return OthersMessageWidget(
                            message: msg,
                            sameDate: sameDate,
                            sameUser: sameUser,
                          );
                        },
                      ),
                    );
                  },
                  error: (error, stackTrace) => Container(),
                  loading: AppLoader.new,
                ),
          ),
          AppSpaces.v8,
          Row(
            children: [
              AppSpaces.h16,
              AppIcon(
                onPressed: uploadingImage.value ? null : pickAndSendImage,
                icon: uploadingImage.value
                    ? Icons.hourglass_empty
                    : Icons.image,
                size: 30,
                color: context.colorScheme.secondary,
              ),
              Expanded(child: msgTextField()),
              AppSpaces.h8,
              AppIcon(
                onPressed: sendPressed,
                // icon: Icons.send,
                path: AppAssets.send,
                size: 44,
                padding: const EdgeInsets.only(right: 4, top: 4, bottom: 4),
              ),
              AppSpaces.h8,
            ],
          ),
          AppSpaces.v8,
        ],
      ),
    );
  }

  bool isSameDate({
    required ChatMessage msg,
    required List<ChatMessage> messages,
    required int index,
  }) {
    // If it's the last message in the list, it should show the date
    if (index == messages.length - 1) {
      return false;
    }

    // Since the list is reversed in the ListView, we compare with the next message
    // which is actually the previous message chronologically
    final nextMessageIndex = index + 1;

    if (nextMessageIndex < messages.length) {
      final nextMessage = messages[nextMessageIndex];
      return msg.timestamp.isSameDay(nextMessage.timestamp);
    }

    return false;
  }

  bool isSameUser({
    required ChatMessage msg,
    required List<ChatMessage> messages,
    required int index,
  }) {
    // If it's the last message in the list, it should show the user
    if (index == messages.length - 1) {
      return false;
    }

    // Since the list is reversed in the ListView, we compare with the next message
    // which is actually the previous message chronologically
    final nextMessageIndex = index + 1;

    if (nextMessageIndex < messages.length) {
      final nextMessage = messages[nextMessageIndex];
      return msg.senderId == nextMessage.senderId;
    }

    return false;
  }
}
