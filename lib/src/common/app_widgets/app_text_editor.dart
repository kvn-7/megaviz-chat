import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppTextEditor extends StatelessWidget {
  const AppTextEditor({
    super.key,
    required this.quillController,
    required this.maxLength,
    required this.title,
    required this.hintText,
  });

  final quill.QuillController quillController;
  final int maxLength;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(context.appUiUtils.borderRadius),
        border: Border.all(color: context.colorScheme.outline.withOpacity(0.5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: AppText(text: title, style: context.textTheme.titleMedium),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: quill.QuillSimpleToolbar(
                  controller: quillController,
                  config: quill.QuillSimpleToolbarConfig(
                    showFontFamily: false,
                    showFontSize: false,
                    showHeaderStyle: false,
                    showDividers: false,
                    showColorButton: false,
                    showBackgroundColorButton: false,
                    showClearFormat: false,
                    showIndent: false,
                    showLink: false,
                    showCodeBlock: false,
                    showInlineCode: false,
                    showUndo: false,
                    showRedo: false,
                    showSearchButton: false,
                    showSubscript: false,
                    showSuperscript: false,
                  ),
                ),
              ),
            ],
          ),

          Container(
            decoration: BoxDecoration(
              color: context.colorScheme.secondary,
              borderRadius: BorderRadius.circular(
                context.appUiUtils.borderRadius * 0.5,
              ),
            ),
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            constraints: BoxConstraints(
              minHeight: 120,
              maxHeight: context.screenHeight * 0.35,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: quill.QuillEditor.basic(
                controller: quillController,
                config: quill.QuillEditorConfig(
                  showCursor: true,
                  autoFocus: true,
                  placeholder: hintText,
                  padding: const EdgeInsets.all(8),
                  scrollable: true,
                  expands: false,
                  scrollBottomInset: 0,
                  keyboardAppearance: Brightness.light,
                  enableInteractiveSelection: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CounterWidget extends HookConsumerWidget {
  const CounterWidget({
    required this.quillController,
    required this.maxLength,
    super.key,
  });

  final quill.QuillController quillController;
  final int maxLength;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final length = useState(quillController.document.length);

    void onDocumentChange(quill.DocChange change) {
      length.value = quillController.document.length;
    }

    useEffect(() {
      quillController.document.changes.listen(onDocumentChange);

      return null;
    }, []);

    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AppText(
          text: '${length.value}/$maxLength',
          style: context.textTheme.bodySmall,
        ),
      ),
    );
  }
}

class AppTextEditorPreview extends StatelessWidget {
  const AppTextEditorPreview({
    super.key,
    required this.quillController,
    this.title,
    this.hintText,
    this.onTap,
  });

  final quill.QuillController quillController;
  final String? title;
  final String? hintText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final document = quillController.document;
    final empty = document.isEmpty();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          AppText(
            text: title ?? '',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          AppSpaces.v8,
        ],
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.colorScheme.secondary,
              borderRadius: BorderRadius.circular(
                context.appUiUtils.borderRadius,
              ),
            ),
            height: 72,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: empty
                ? AppText(
                    text: hintText ?? '',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                  )
                : SingleChildScrollView(
                    child: FormattedText(
                      text: jsonEncode(document.toDelta().toList()),
                    ),
                  ),
            // child: quill.QuillEditor.basic(
            //   controller: quillController,
            //   configurations: const quill.QuillEditorConfigurations(
            //     showCursor: false, //hide the cursor
            //     enableInteractiveSelection: false,
            //   ),
            // ),
          ),
        ),
      ],
    );
  }
}

class FormattedText extends StatelessWidget {
  const FormattedText({
    super.key,
    required this.text,
    this.style,
    this.align,
    this.overflow,
    this.maxLines,
    this.richText = true,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? align;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool richText;

  @override
  Widget build(BuildContext context) {
    List<dynamic> json;

    try {
      log('FormattedText: $text');

      json = jsonDecode(text) as List<dynamic>;
    } catch (e) {
      return AppText(text: text);
    }

    Widget buildFormattedPreview(
      quill.Document document,
      BuildContext context,
    ) {
      // final children = <Widget>[];

      // Accumulate text and styles into a single TextSpan
      // var currentTextSpan = TextSpan(style: context.textTheme.bodyMedium);

      // for (final node in document.toDelta().toList()) {
      //   final text = node.value.toString();
      //   final attributes = node.attributes ?? {};

      //   // // Skip empty text nodes or nodes with only white spaces
      //   // if (text.trim().isEmpty) {
      //   //   continue;
      //   // }

      //   var span = TextSpan(text: text);

      //   if (attributes.containsKey('bold')) {
      //     span = TextSpan(
      //       text: text,
      //       style: context.textTheme.bodyMedium
      //           ?.copyWith(fontWeight: FontWeight.bold),
      //     );
      //   } else if (attributes.containsKey('list')) {
      //     final bullet = attributes['list'] == 'bullet' ? '\u2022 ' : '';
      //     span = TextSpan(
      //       text: '$bullet$text',
      //       style: context.textTheme.bodyMedium,
      //     );
      //   }

      //   currentTextSpan = TextSpan(
      //     children: <TextSpan>[currentTextSpan, span],
      //   );
      // }

      // return RichText(text: currentTextSpan);

      return quill.QuillStyles(
        data: quill.DefaultStyles(
          paragraph: quill.DefaultTextBlockStyle(
            style ?? context.textTheme.bodyMedium!,
            quill.HorizontalSpacing.zero,
            quill.VerticalSpacing.zero,
            quill.VerticalSpacing.zero,
            null,
          ),
          lists: quill.DefaultListBlockStyle(
            style ?? context.textTheme.bodyMedium!,
            quill.HorizontalSpacing.zero,
            quill.VerticalSpacing.zero,
            quill.VerticalSpacing.zero,
            null,
            null,
          ),
        ),
        child: quill.QuillEditor.basic(
          controller: quill.QuillController(
            document: document,
            selection: const TextSelection.collapsed(offset: 0),
            readOnly: true,
          ),
          config: const quill.QuillEditorConfig(
            showCursor: false,
            enableInteractiveSelection: false,
            customStyles: quill.DefaultStyles(),
          ),
        ),
      );
    }

    final document = quill.Document.fromJson(json);
    return buildFormattedPreview(document, context);
  }
}
