import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.fontSize});

  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'EveTask',
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
