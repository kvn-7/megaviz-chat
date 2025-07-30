import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_empty_widget.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_loader.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_scaffold.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/features/chat/presentation/providers/chats_provider.dart';
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
              return ListView.separated(
                itemBuilder: (context, index) {
                  final chat = data[index];

                  return ChatWidget(chat: chat);
                },
                separatorBuilder: (context, index) {
                  return AppSpaces.v8;
                },
                itemCount: data.length,
              );
            },
            error: (error, stackTrace) {
              return AppEmptyWidget(text: error.toString());
            },
            loading: () {
              return AppLoader();
            },
          ),
    );
  }
}
