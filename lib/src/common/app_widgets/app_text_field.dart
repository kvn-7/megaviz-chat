import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

enum ValidationType { none, required, email, number, phone }

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.value,
    this.hintText,
    this.maxLength,
    this.textInputType,
    this.error,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
    this.prefix,
    this.suffix,
    this.showCounter = false,
    this.labelText,
    this.labelStyle,
    this.floatingLabelStyle,
    this.readOnly = false,
    this.onTap,
    this.fieldTitle,
    this.isRequired = false,
    this.exText,
    this.fillColor,
    this.padding,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.validator,
    this.hintTextStyle,
    this.border,
    this.textStyle,
    this.capitalization,
    this.obscureText = false,
    this.height,
    this.textAlign,
    this.autoFocus = false,
    this.expands = false,
    this.enabled,
  });

  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final String? value;
  final String? hintText;
  final int? maxLength;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? error;
  final int? maxLines;
  final int? minLines;
  final Widget? prefix;
  final Widget? suffix;
  final bool showCounter;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final bool readOnly;
  final void Function()? onTap;
  final String? fieldTitle;
  final bool isRequired;
  final String? exText;
  final Color? fillColor;
  final EdgeInsetsGeometry? padding;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final void Function(String value)? onFieldSubmitted;
  final String? Function(String? value)? validator;
  final TextStyle? hintTextStyle;
  final InputBorder? border;
  final TextStyle? textStyle;
  final TextCapitalization? capitalization;
  final bool obscureText;
  final double? height;
  final bool autoFocus;
  final TextAlign? textAlign;
  final bool expands;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fieldTitle != null) ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: AppText(
                  text: fieldTitle!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              if (isRequired)
                AppText(
                  text: ' *',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
            ],
          ),
          AppSpaces.v8,
        ],
        SizedBox(
          height: height,
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            keyboardType: textInputType,
            textCapitalization: capitalization ?? TextCapitalization.sentences,
            onChanged: onChanged,
            textInputAction: textInputAction,
            maxLength: maxLength,
            initialValue: value,
            inputFormatters: inputFormatters,
            maxLines: maxLines,
            minLines: minLines,
            readOnly: readOnly,
            onTap: onTap,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            validator: validator,
            obscureText: obscureText,
            textAlign: textAlign ?? TextAlign.start,
            autofocus: autoFocus,
            expands: expands,
            cursorColor: context.colorScheme.primary,
            decoration: InputDecoration(
              contentPadding: padding,
              hintText: hintText,
              counterText: !showCounter ? '' : null,
              labelText: labelText != null
                  ? isRequired
                        ? '${labelText!}*'
                        : labelText
                  : null,
              alignLabelWithHint: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: prefix,
              ),
              prefixIconConstraints: const BoxConstraints(),
              suffixIcon: suffix,
              suffixIconConstraints: const BoxConstraints(),
              fillColor: fillColor,
              // filled: fillColor != null,
              border: border,
              hintStyle: hintTextStyle,
              labelStyle: labelStyle,
              floatingLabelStyle: floatingLabelStyle,
            ),
            style: textStyle,
          ),
        ),
        if (exText != null) ...[
          AppSpaces.v4,
          AppText(text: exText!, style: Theme.of(context).textTheme.bodySmall),
        ],
      ],
    );
  }
}

class NameTextInputFormatter extends TextInputFormatter {
  // Define the allowed characters using a RegExp pattern
  final RegExp _allowedCharacters = RegExp(r'[a-zA-Z0-9\s\-\._]');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove any disallowed characters from the new value
    final filteredText = newValue.text
        .split('')
        .where(_allowedCharacters.hasMatch)
        .join();
    return TextEditingValue(text: filteredText, selection: newValue.selection);
  }
}

class PriceTextInputFormatter extends TextInputFormatter {
  final RegExp _allowedCharacters = RegExp(r'[0-9\.]');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final filteredText = newValue.text
        .split('')
        .where(_allowedCharacters.hasMatch)
        .join();
    return TextEditingValue(text: filteredText, selection: newValue.selection);
  }
}
