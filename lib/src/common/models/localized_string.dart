import 'package:flutter/material.dart';

typedef LocalizedString = Map<String, String>;

extension LocalizedStringExtension on LocalizedString {
  String getString(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;
    return this[languageCode] ?? this['en'] ?? '';
  }

  bool containsKey(String key) {
    return this.containsKey(key);
  }

  List<String> get allKeys => keys.toList();

  List<String> get allValues => values.toList();
}
