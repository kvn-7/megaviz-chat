import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppMenuBottomSheet extends StatelessWidget {
  const AppMenuBottomSheet({super.key, required this.items});

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(mainAxisSize: MainAxisSize.min, children: items),
    );
  }
}

class AppMenuBottomSheetItem extends StatelessWidget {
  const AppMenuBottomSheetItem({
    super.key,
    required this.text,
    required this.onPressed,
    this.leadingIcon,
    this.style,
  });

  final void Function() onPressed;
  final String text;
  final TextStyle? style;
  final Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        onPressed();
      },
      child: Container(
        width: context.screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            if (leadingIcon != null) ...[leadingIcon!, AppSpaces.h8],
            AppText(text: text, style: style ?? context.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
