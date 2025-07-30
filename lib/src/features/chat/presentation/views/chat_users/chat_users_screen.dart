import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_empty_widget.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_loader.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_scaffold.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/features/chat/presentation/providers/available_chat_users_provider.dart';
import 'package:megaviz_chat/src/features/chat/presentation/views/chat_users/widgets/chat_user_widget.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class ChatUsersScreen extends ConsumerWidget {
  const ChatUsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: AppBar(title: AppText(text: context.appLocalizations.chatUsers)),
      body: ref
          .watch(availableChatUsersProvider)
          .when(
            data: (data) {
              if (data.isEmpty) {
                return AppEmptyWidget(
                  text: context.appLocalizations.noUsersFound,
                );
              }

              return ListView.separated(
                itemBuilder: (context, index) {
                  final user = data[index];

                  return ChatUserWidget(user: user);
                },
                separatorBuilder: (context, index) {
                  return AppSpaces.v8;
                },
                itemCount: data.length,
              );
            },
            error: (error, stackTrace) {
              return AppEmptyWidget();
            },
            loading: () {
              return AppLoader();
            },
          ),
    );
  }
}
