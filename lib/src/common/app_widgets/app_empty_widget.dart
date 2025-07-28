import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        text: text ?? context.appLocalizations.nothingToShow,
        style: context.textTheme.bodyLarge,
      ),
    );
  }
}
