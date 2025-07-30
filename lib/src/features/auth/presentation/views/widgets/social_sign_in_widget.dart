import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_svg.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class SocialSignInWidget extends StatelessWidget {
  const SocialSignInWidget({
    required this.name,
    required this.iconPath,
    required this.onPressed,
    this.color,
    super.key,
  });

  final String name;
  final String iconPath;
  final void Function() onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(context.appUiUtils.borderRadius),
          border: Border.all(color: context.colorScheme.outline),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppSvg(path: iconPath, height: 32, width: 32, color: color),
            AppSpaces.h16,
            AppText(text: name, style: context.textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
