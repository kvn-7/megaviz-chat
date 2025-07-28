// ignore_for_file: use_setters_to_change_properties

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_language.g.dart';

enum Language {
  english(name: 'English', code: 'en'),
  hindi(name: 'हिंदी', code: 'hi');

  const Language({required this.name, required this.code});

  final String name;
  final String code;
}

@riverpod
class AppLanguageProvider extends _$AppLanguageProvider {
  @override
  Language build() {
    return Language.english;
  }

  void changeLang(Language lang) {
    state = lang;
  }
}
