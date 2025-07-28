import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    required this.text,
    super.key,
    this.style,
    this.align,
    this.overflow,
    this.maxLines,
    this.richText = false,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? align;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool richText;

  @override
  Widget build(BuildContext context) {
    // if (richText) {
    //   return FormattedText(
    //     text: text,
    //     style: style,
    //   );
    // }

    return Text(
      text,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
      style: style,
    );
  }
}
