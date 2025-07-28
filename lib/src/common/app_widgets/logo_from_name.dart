import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class LogoFromName extends StatelessWidget {
  const LogoFromName({
    super.key,
    required this.name,
    this.size = 60,
    this.radius = 100,
  });

  final String name;
  final double size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color.fromRGBO(0, 84, 147, 1), // 005493
      const Color.fromRGBO(1, 58, 100, 1), // 013a64
      const Color.fromRGBO(15, 1, 100, 1), // #0f0164
      const Color.fromRGBO(72, 1, 100, 1), // #480164
      const Color.fromRGBO(100, 1, 70, 1), // #640146
      const Color.fromRGBO(100, 1, 1, 1), // #640101
      const Color.fromRGBO(1, 100, 94, 1), // #01645e
      const Color.fromRGBO(1, 100, 47, 1), // #01642f
      const Color.fromRGBO(91, 128, 2, 1), // #5b8002
      const Color.fromRGBO(125, 128, 2, 1), // #7d8002
      const Color.fromRGBO(128, 100, 2, 1), // #806402
    ];

    var colorIndex = name.hashCode % colors.length;
    colorIndex = colorIndex < 0 ? colorIndex + colors.length : colorIndex;

    final twoWords = name.split(' ');

    var text = '';

    if (twoWords.length > 1) {
      text = twoWords[0][0].toUpperCase() + twoWords[1][0].toUpperCase();
    } else if (twoWords.isNotEmpty) {
      text = twoWords[0][0].toUpperCase();
    } else {
      text = '?';
    }

    return Container(
      decoration: BoxDecoration(
        // color: colors[colorIndex],
        color: const Color.fromRGBO(33, 41, 54, 1),
        borderRadius: BorderRadius.circular(radius),
      ),
      height: size,
      width: size,
      padding: EdgeInsets.symmetric(horizontal: size / 6, vertical: size / 6),
      child: FittedBox(
        child: AppText(
          text: text,
          style: context.textTheme.titleMedium?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
