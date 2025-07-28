import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_svg.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.onPressed,
    this.path,
    this.icon,
    this.color,
    this.size = 24,
    this.bgColor,
    this.padding = const EdgeInsets.all(8),
  }) : assert(
         path != null || icon != null,
         'Either path or icon must be provided',
       ),
       assert(
         path == null || icon == null,
         'Either path or icon must be provided',
       );

  final void Function()? onPressed;
  final String? path;
  final IconData? icon;
  final Color? color;
  final double size;
  final Color? bgColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: AnimatedSwitcher(
        duration: Durations.short3,
        child: Container(
          padding: onPressed != null ? padding : null,
          decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
          child: path != null
              ? AppSvg(
                  path: path!,
                  color: color ?? context.colorScheme.onSurface,
                  height: size,
                  width: size,
                )
              : Icon(
                  icon,
                  color: color ?? context.colorScheme.onSurface,
                  size: size,
                ),
        ),
      ),
    );
  }
}
