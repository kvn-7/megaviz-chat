// import 'package:flutter/material.dart';
// import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

// class AppValidators {
//   AppValidators(this.context);

//   BuildContext context;

//   String? requiredPhone(String? value) {
//     if (value == null || value.isEmpty) {
//       return context.appLocalizations.requiredField;
//     }

//     final israeliPhoneRegExp = RegExp(r'^0[2-9]\d{7,8}$');

//     if (!israeliPhoneRegExp.hasMatch(value)) {
//       return context.appLocalizations.invalidPhoneNumber;
//     }

//     return null;
//   }

//   String? requiredEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return context.appLocalizations.requiredField;
//     }

//     final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if (!emailRegExp.hasMatch(value)) {
//       return context.appLocalizations.invalidEmail;
//     }

//     return null;
//   }
// }
