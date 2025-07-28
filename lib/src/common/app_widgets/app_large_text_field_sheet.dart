import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text_field.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppLargeTextFieldSheet extends StatelessWidget {
  const AppLargeTextFieldSheet({
    super.key,
    required this.controller,
    required this.maxLength,
    required this.title,
    required this.hintText,
  });

  final TextEditingController controller;
  final int maxLength;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(text: title, style: context.textTheme.titleMedium),
          AppSpaces.v16,
          Flexible(
            child: SingleChildScrollView(
              child: AppTextField(
                textInputAction: TextInputAction.newline,
                controller: controller,
                hintText: hintText,
                maxLines: null, // Allow unlimited lines
                maxLength: maxLength,
                minLines: 14,
                showCounter: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
