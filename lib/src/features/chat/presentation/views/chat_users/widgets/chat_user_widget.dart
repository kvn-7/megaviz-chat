import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_image.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:megaviz_chat/src/features/chat/presentation/providers/user_chat_provider.dart';
import 'package:megaviz_chat/src/features/router/app_router.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class ChatUserWidget extends ConsumerWidget {
  const ChatUserWidget({super.key, required this.user});
  final ChatUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        final chat = await ref.read(userChatProvider(user.id).future);

        if (!context.mounted) return;

        context.pushNamed(AppRoutes.messages.name, extra: chat);
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(context.appUiUtils.borderRadius),
          border: Border.all(color: context.colorScheme.outline),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            AppImage.network(
              url: user.photoUrl,
              height: 48,
              width: 48,
              radius: BorderRadius.circular(100),
            ),
            AppSpaces.h8,
            Expanded(
              child: AppText(
                text: user.name,
                style: context.textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
