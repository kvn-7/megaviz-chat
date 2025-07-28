import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class PoweredBy extends StatelessWidget {
  const PoweredBy({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'Powered by ', style: context.textTheme.bodyMedium),
          TextSpan(
            text: 'TEJIS.AI',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
