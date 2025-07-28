import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.child,
    this.onTap,
  });

  final EdgeInsetsGeometry padding;
  final Widget? child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(context.appUiUtils.borderRadius),
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}
