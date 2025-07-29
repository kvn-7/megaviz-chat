import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_image.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:megaviz_chat/src/features/chat/presentation/providers/chat_user_provider.dart';
import 'package:megaviz_chat/src/features/chat/presentation/providers/last_message_provider.dart';
import 'package:megaviz_chat/src/features/router/app_router.dart';
import 'package:megaviz_chat/src/utils/extensions/app_date_time_extension.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class ChatWidget extends ConsumerWidget {
  const ChatWidget({super.key, required this.chat});
  final Chat chat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(lastMessageProvider(chat.id)).valueOrNull;

    return GestureDetector(
      onTap: () async {
        context.pushNamed(AppRoutes.messages.name, extra: chat);
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(context.appUiUtils.borderRadius),
          border: Border.all(color: context.colorScheme.outline),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ref
            .watch(chatUserProvider(chat.userId))
            .when(
              data: (user) {
                return Row(
                  children: [
                    AppImage.network(
                      url: user?.photoUrl,
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
                            text: user?.name ?? '',
                            style: context.textTheme.titleMedium,
                          ),
                          AppSpaces.v4,
                          if (message != null)
                            AppText(
                              text: message.content is TextContent
                                  ? (message.content as TextContent).text
                                  : context.appLocalizations.image,
                              style: context.textTheme.bodyMedium,
                            ),
                        ],
                      ),
                    ),
                    AppSpaces.h8,
                    AppText(
                      text: message?.timestamp.verboseTimeOrDate ?? '',
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                );
              },
              error: (error, stackTrace) => Container(),
              loading: () => Container(),
            ),
      ),
    );
  }
}
