import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_button.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppAlertSheet extends StatelessWidget {
  const AppAlertSheet({
    super.key,
    required this.title,
    required this.message,
    required this.actionButtonText,
    required this.onOverride,
    this.cancelText,
  });

  final String title;
  final String message;
  final String actionButtonText;
  final String? cancelText;
  final void Function() onOverride;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: title,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.error,
            ),
          ),
          AppSpaces.v8,
          AppText(text: message, style: context.textTheme.bodyMedium),
          AppSpaces.v32,
          Row(
            children: [
              Expanded(
                child: AppButton(
                  onPressed: () {
                    context.pop();
                  },
                  text: cancelText ?? context.appLocalizations.cancel,
                  color: context.colorScheme.error.withValues(alpha: 0.3),
                ),
              ),
              AppSpaces.h16,
              Expanded(
                child: AppButton(
                  onPressed: () {
                    context.pop();

                    onOverride();
                  },
                  text: actionButtonText,
                  color: context.colorScheme.error,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
