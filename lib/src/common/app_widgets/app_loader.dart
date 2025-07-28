import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.color,
    this.height,
    this.width,
    this.text,
    this.center = true,
  });
  final Color? color;
  final double? height;
  final double? width;
  final String? text;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: height ?? 60,
          width: width ?? 60,
          child: LoadingIndicator(
            indicatorType: Indicator.circleStrokeSpin,
            colors: [color ?? Theme.of(context).colorScheme.primary],
          ),
        ),
        if (text != null) ...[AppSpaces.v4, AppText(text: text!)],
      ],
    );

    return center ? Center(child: content) : content;
  }
}
