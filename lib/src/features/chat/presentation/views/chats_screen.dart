import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_empty_widget.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_loader.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_scaffold.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:megaviz_chat/src/features/chat/presentation/providers/chats_provider.dart';
import 'package:megaviz_chat/src/features/chat/presentation/providers/last_message_provider.dart';
import 'package:megaviz_chat/src/features/chat/presentation/views/widgets/chat_widget.dart';
import 'package:megaviz_chat/src/features/notifications/presentation/providers/notifications_utils_provider.dart';
import 'package:megaviz_chat/src/features/router/app_router.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class ChatsScreen extends HookConsumerWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(appNotificationUtilsProvider).init(context);

    return AppScaffold(
      appBar: AppBar(title: AppText(text: context.appLocalizations.chat)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(AppRoutes.chatUsers.name);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ref
          .watch(chatsProvider)
          .when(
            data: (data) {
              if (data.isEmpty) {
                return AppEmptyWidget(
                  text: context.appLocalizations.startNewChat,
                );
              }

              return FutureBuilder<List<Chat>>(
                future: _sortChats(data, ref),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return AppLoader();
                  }

                  final sortedChats = snapshot.data!;

                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final chat = sortedChats[index];
                      return ChatWidget(chat: chat);
                    },
                    separatorBuilder: (context, index) {
                      return AppSpaces.v8;
                    },
                    itemCount: sortedChats.length,
                  );
                },
              );
            },
            error: (error, stackTrace) {
              return AppEmptyWidget(
                text: context.appLocalizations.startNewChat,
              );
            },
            loading: () {
              return AppLoader();
            },
          ),
    );
  }

  // Add this helper method to the ChatsScreen class
  Future<List<Chat>> _sortChats(List<Chat> chats, WidgetRef ref) async {
    final chatWithTimestamps = <MapEntry<Chat, DateTime>>[];

    for (final chat in chats) {
      ChatMessage? lastMessage;
      try {
        lastMessage = await ref.watch(lastMessageProvider(chat.id).future);
      } catch (e) {
        lastMessage = null;
      }
      final timestamp =
          lastMessage?.timestamp ?? DateTime.fromMillisecondsSinceEpoch(0);
      chatWithTimestamps.add(MapEntry(chat, timestamp));
    }

    // Sort by timestamp in descending order (most recent first)
    chatWithTimestamps.sort((a, b) => b.value.compareTo(a.value));

    return chatWithTimestamps.map((entry) => entry.key).toList();
  }
}
