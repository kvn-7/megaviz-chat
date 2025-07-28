import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppOtpField extends StatefulWidget {
  const AppOtpField({
    super.key,
    required this.inputFieldLength,
    this.spaceBetweenFields = 5,
    this.autoFocus = true,
    required this.onValueChange,
    required this.onCompleted,
    this.inputDecoration,
    this.cursorColor,
  });

  final int inputFieldLength;
  final double spaceBetweenFields;
  final bool autoFocus;
  final ValueChanged<String> onValueChange;
  final ValueChanged<String> onCompleted;
  final InputDecoration? inputDecoration;
  final Color? cursorColor;

  @override
  State<StatefulWidget> createState() => _AppOtpField();
}

class _AppOtpField extends State<AppOtpField> {
  List<TextEditingController> controller = [];
  List<FocusNode> focusNodes = [];
  List<FocusNode> focusNodes1 = [];

  void initControllers(int size) {
    for (var i = 0; i < size; i++) {
      controller.add(TextEditingController(text: ''));
      focusNodes.add(FocusNode());
      focusNodes1.add(FocusNode());
    }
  }

  @override
  void initState() {
    super.initState();
    initControllers(widget.inputFieldLength);
    if (widget.autoFocus) {
      focusNodes[0].requestFocus();
    }
  }

  void checkAllTextFieldsCompleted() {
    var isFieldsCompleted = true;
    var otpText = '';
    for (var i = 0; i < widget.inputFieldLength; i++) {
      if (controller[i].text.isNotEmpty) {
        otpText += controller[i].text;
      } else {
        isFieldsCompleted = false;
      }
    }
    if (isFieldsCompleted) {
      widget.onCompleted(otpText);
    }
  }

  String getOtpText() {
    var otpText = '';
    for (var i = 0; i < widget.inputFieldLength; i++) {
      if (controller[i].text.isNotEmpty) {
        otpText += controller[i].text;
      }
    }

    return otpText;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < widget.inputFieldLength; i++) ...[
          Expanded(child: otpField(i, widget.inputFieldLength)),
          if (i != widget.inputFieldLength - 1)
            SizedBox(width: widget.spaceBetweenFields),
        ],
      ],
    );
  }

  Widget otpField(int index, int boxSize) {
    return KeyboardListener(
      onKeyEvent: (KeyEvent event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey.keyLabel == 'Backspace') {
            if (index > 0) {
              focusNodes[index - 1].requestFocus();
            }
            widget.onValueChange(getOtpText());
          } else {
            if (controller[index].text.length == 1) {
              if (index < boxSize - 1) {
                if (event.character.toString().isNumeric) {
                  focusNodes[index + 1].requestFocus();
                  controller[index + 1].text = event.character.toString();
                  widget.onValueChange(getOtpText());
                  checkAllTextFieldsCompleted();
                }
              }
            }
          }
        }
      },
      focusNode: focusNodes1[index],
      child: TextFormField(
        textAlign: TextAlign.center,
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        controller: controller[index],
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: 1,
        onChanged: (value) {
          if (value.isNumeric) {
            if (index < boxSize - 1) {
              focusNodes[index + 1].requestFocus();
            }
          }
          widget.onValueChange(getOtpText());
          checkAllTextFieldsCompleted();
        },
        decoration: const InputDecoration(counterText: ''),
      ),
    );
  }
}

extension Numeric on String {
  bool get isNumeric => num.tryParse(this) != null;
}
