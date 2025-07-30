import 'package:flutter/widgets.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppDot extends StatelessWidget {
  const AppDot({super.key, this.color, this.margin = 4, this.size = 3});

  final Color? color;
  final double margin;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: margin),
      decoration: BoxDecoration(
        color: color ?? context.colorScheme.onSurface,
        shape: BoxShape.circle,
      ),
    );
  }
}
