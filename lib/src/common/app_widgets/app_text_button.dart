import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';

class AppTextButton extends ConsumerWidget {
  const AppTextButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.textStyle,
    this.padding,
    this.prefix,
    this.prefixPadding,
    this.name,
  });
  final String text;
  final void Function() onPressed;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? prefix;
  final EdgeInsetsGeometry? prefixPadding;
  final String? name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefix != null)
            Padding(
              padding: prefixPadding ?? const EdgeInsets.only(right: 4),
              child: prefix,
            ),
          AppText(text: text, style: textStyle),
        ],
      ),
    );
  }
}
