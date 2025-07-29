import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/features/chat/domain/entities/chat.dart';
import 'package:megaviz_chat/src/utils/extensions/app_date_time_extension.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class MyMessageWidget extends StatelessWidget {
  const MyMessageWidget({
    super.key,
    required this.message,
    required this.sameDate,
    required this.sameUser,
  });

  final ChatMessage message;
  final bool sameDate;
  final bool sameUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!sameDate) dateWidget(context),
        textMessage(context),
        // time(context),
      ],
    );
  }

  Widget dateWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(height: 0.2, color: context.colorScheme.onSurface),
          ),
          AppSpaces.h16,
          AppText(
            text: message.timestamp.verboseDate,
            style: context.textTheme.titleSmall?.copyWith(
              color: context.appColors.darkGreyText,
            ),
          ),
          AppSpaces.h16,
          Expanded(
            child: Container(height: 0.2, color: context.colorScheme.onSurface),
          ),
        ],
      ),
    );
  }

  Widget textMessage(BuildContext context) {
    final continuous = sameUser && sameDate;

    final borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(context.appUiUtils.borderRadius),
      bottomRight: (!continuous
          ? Radius.zero
          : Radius.circular(context.appUiUtils.borderRadius)),
      topLeft: Radius.circular(context.appUiUtils.borderRadius),
      topRight: (continuous
          ? Radius.zero
          : Radius.circular(context.appUiUtils.borderRadius)),
    );

    return Align(
      alignment: Alignment.centerRight,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.secondaryContainer,
            // color: context.appColors.lightGreyText,
            borderRadius: borderRadius,
          ),
          constraints: BoxConstraints(maxWidth: context.screenWidth * 0.8),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: IntrinsicWidth(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: (message.content as TextContent).text,
                    style: context.textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: ' • ',
                    style: context.textTheme.bodySmall?.copyWith(fontSize: 10),
                  ),
                  TextSpan(
                    text: message.timestamp.timeString,
                    style: context.textTheme.bodySmall?.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget time(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: AppText(
        text: message.timestamp.timeString,
        style: context.textTheme.bodySmall?.copyWith(fontSize: 10),
      ),
    );
  }
}
