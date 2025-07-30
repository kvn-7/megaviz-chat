import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_loader.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppButton extends ConsumerWidget {
  const AppButton({
    required this.onPressed,
    required this.text,
    super.key,
    this.color,
    this.isLoading,
    this.padding,
    this.loaderColor,
    this.height,
    this.width,
    this.textStyle,
    this.constraints,
    this.prefix,
    this.suffix,
    this.elevation,
    this.onLongPress,
    this.enabled = true,
    this.smallButton = false,
    this.name,
  });

  final bool smallButton;
  final void Function() onPressed;
  final void Function()? onLongPress;
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final bool? isLoading;
  final Color? loaderColor;
  final double? height;
  final double? width;
  final BoxConstraints? constraints;
  final EdgeInsets? padding;
  final Widget? prefix;
  final Widget? suffix;
  final double? elevation;
  final bool enabled;
  final String? name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void finalOnPressed() {
      FocusManager.instance.primaryFocus?.unfocus();
      // if (name != null) {
      //   ref.read(analyticsUtilsProvider).buttonClick(name!);
      // }
      onPressed();
    }

    return GestureDetector(
      onTap: finalOnPressed,
      child: SizedBox(
        height: height,
        width: width,
        child: FilledButton(
          onLongPress: onLongPress,
          // onPressed: () {
          //   FocusManager.instance.primaryFocus?.unfocus();
          //   // if (name != null) {
          //   //   ref.read(analyticsUtilsProvider).buttonClick(name!);
          //   // }
          //   onPressed();
          // },
          onPressed: enabled ? finalOnPressed : null,
          style: ElevatedButton.styleFrom(
            elevation: elevation,
            shadowColor: color,
            minimumSize: Size.zero,
            padding: smallButton && padding == null
                ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                : padding,
            backgroundColor: !enabled
                ? context.colorScheme.primary.withOpacity(0.25)
                : color,
            textStyle:
                textStyle ??
                (smallButton
                    ? context.textTheme.titleMedium?.copyWith(
                        color: context.colorScheme.onPrimary,
                      )
                    : null),
          ),
          child: isLoading ?? false
              ? AppLoader(
                  center: false,
                  color: loaderColor ?? context.colorScheme.onPrimary,
                  height: 30,
                  width: 30,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (prefix != null) ...[prefix!, AppSpaces.h8],
                    AppText(
                      text: text,
                      // style: textStyle ??
                      //     (smallButton
                      //         ? context.textTheme.titleMedium?.copyWith(
                      //             color: context.colorScheme.onPrimary,
                      //           )
                      //         : null),
                    ),
                    if (suffix != null) suffix!,
                  ],
                ),
        ),
      ),
    );
  }
}
