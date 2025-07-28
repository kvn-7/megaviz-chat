import 'package:flutter/widgets.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppDot extends StatelessWidget {
  const AppDot({super.key, this.color, this.margin = 4});

  final Color? color;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      height: 3,
      margin: EdgeInsets.symmetric(horizontal: margin),
      decoration: BoxDecoration(
        color: color ?? context.colorScheme.onSurface,
        shape: BoxShape.circle,
      ),
    );
  }
}
