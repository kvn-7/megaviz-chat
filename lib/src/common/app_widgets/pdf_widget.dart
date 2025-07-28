import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class PdfWidget extends StatelessWidget {
  const PdfWidget({
    super.key,
    required this.title,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  });

  final String title;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(context.appUiUtils.borderRadius),
        ),
        padding: padding,
        child: Row(
          children: [
            const Icon(Icons.picture_as_pdf, color: Colors.white),
            AppSpaces.h8,
            Expanded(
              child: AppText(
                text: title,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
