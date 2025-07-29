import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_icon.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_image.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_scaffold.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text_field.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:megaviz_chat/src/features/chat/presentation/providers/chat_user_provider.dart';
import 'package:megaviz_chat/src/features/chat/presentation/providers/send_message_state_provider.dart';
import 'package:megaviz_chat/src/utils/assets/app_assets.dart';
import 'package:megaviz_chat/src/utils/extensions/app_date_time_extension.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class MessagesScreen extends HookConsumerWidget {
  const MessagesScreen({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    // final scrollController = useScrollController(); // Add ScrollController hook

    final sending = useState(false);

    useEffect(() {
      // ref
      //     .read(conversationsRepositoryProvider)
      //     .markAllRead(conversationId: conversation.id);
      return null;
    }, []);

    // useEffect(() {
    //   // scrollController.addListener(() {
    //   //   if (!context.mounted) return;

    //   //   // Detect if the user has scrolled to the top of the list
    //   //   if (scrollController.position.atEdge &&
    //   //       scrollController.position.pixels == 0) {
    //   //     // Load more messages when at the top
    //   //     ref.read(messagesProvider(conversation.id).notifier).loadMore();
    //   //   }
    //   // });
    //   // return scrollController.dispose;

    //   void scrollListener() {
    //     if (scrollController.position.pixels >=
    //             scrollController.position.maxScrollExtent &&
    //         !ref.read(messagesProvider(chat.id)).isLoading) {
    //       ref.read(messagesProvider(chat.id).notifier).loadMore();
    //     }
    //   }

    //   scrollController.addListener(scrollListener);

    //   // Clean up the listener when the widget is disposed
    //   return () => scrollController.removeListener(scrollListener);
    // }, [scrollController]);

    Widget msgTextField() {
      return AppTextField(
        textInputAction: TextInputAction.newline,
        controller: controller,
        hintText: context.appLocalizations.typeMessage,
        maxLines: 8,
        maxLength: 1000,
        minLines: 1,
        // suffix: AppIcon(
        //   onPressed: () {},
        //   icon: Icons.attach_file_rounded,
        // ),
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
          );

      sending.value = false;

      controller.clear();
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
                      child: AppText(
                        text: user.name,
                        style: context.textTheme.titleMedium,
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
          // Expanded(
          //   child: ref
          //       .watch(messagesProvider(req))
          //       .when(
          //         skipLoadingOnRefresh: true,
          //         skipLoadingOnReload: true,
          //         data: (res) {
          //           final messages = res.messages.toList().reversed.toList();

          //           // final initialTalk = messages.isEmpty;

          //           // if (initialTalk) {
          //           //   Future.delayed(Duration.zero, () {
          //           //     // ignore: use_build_context_synchronously
          //           //     controller.text =
          //           //         context.appLocalizations.firstMessageText(
          //           //       conversation.user.name,
          //           //     );
          //           //   });
          //           // }

          //           return Align(
          //             alignment: Alignment.bottomCenter,
          //             child: ListView.builder(
          //               padding: const EdgeInsets.symmetric(
          //                 horizontal: 16,
          //                 vertical: 16,
          //               ),
          //               shrinkWrap: true,
          //               reverse: true,
          //               controller: scrollController,
          //               itemCount: messages.length,
          //               itemBuilder: (context, index) {
          //                 final originalMessages = res.messages.toList();

          //                 final msg = messages[index];

          //                 final sameDate = isSameDate(
          //                   msg: msg,
          //                   messages: originalMessages,
          //                   index: index,
          //                 );

          //                 final sameUser = isSameUser(
          //                   msg: msg,
          //                   messages: originalMessages,
          //                   index: index,
          //                 );

          //                 final showTime = isShowTime(
          //                   msg: msg,
          //                   messages: originalMessages,
          //                   index: index,
          //                 );

          //                 final userId = ref
          //                     .read(authUserProvider)
          //                     .valueOrNull
          //                     ?.userId;

          //                 final myMessage = msg.senderId == userId;

          //                 if (myMessage) {
          //                   return MyMessageWidget(
          //                     message: msg,
          //                     sameDate: sameDate,
          //                     sameUser: sameUser,
          //                     showTime: showTime,
          //                   );
          //                 }

          //                 return OthersMessageWidget(
          //                   message: msg,
          //                   sameDate: sameDate,
          //                   sameUser: sameUser,
          //                   showTime: showTime,
          //                   isGroup: false,
          //                 );
          //               },
          //             ),
          //           );
          //         },
          //         error: (error, stackTrace) => Container(),
          //         loading: AppLoader.new,
          //       ),
          // ),
          Spacer(),
          AppSpaces.v8,
          Row(
            children: [
              AppSpaces.h16,
              // AppIcon(
              //   onPressed: () {},
              //   icon: Icons.attachment_rounded,
              // ),
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
    messages = messages.toList();
    index = (messages.length - 1) - index;
    if (index == 0) return false;

    final previousMsg = messages[index - 1];
    final sameDate = msg.timestamp.isSameDay(previousMsg.timestamp);
    return sameDate;
  }

  bool isSameUser({
    required ChatMessage msg,
    required List<ChatMessage> messages,
    required int index,
  }) {
    messages = messages.toList();
    index = (messages.length - 1) - index;

    if (index == 0) return false;

    final previousMsg = messages[index - 1];
    final sameUser = msg.senderId == previousMsg.senderId;
    return sameUser;
  }

  bool isShowTime({
    required ChatMessage msg,
    required List<ChatMessage> messages,
    required int index,
  }) {
    messages = messages.toList();
    index = (messages.length - 1) - index;

    if (index == messages.length - 1) return true;

    final nextMsg = messages[index + 1];
    final sameUser = msg.senderId == nextMsg.senderId;

    final showTime = nextMsg.timestamp.difference(msg.timestamp).inMinutes > 3;

    return showTime || !sameUser;
  }
}
