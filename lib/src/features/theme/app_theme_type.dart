// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/features/local_storage/secure_storage.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_type.g.dart';

enum ThemeType { light, dark }

enum UserThemeType {
  system,
  light,
  dark;

  static UserThemeType fromString(String value) {
    switch (value) {
      case 'system':
        return UserThemeType.system;
      case 'light':
        return UserThemeType.light;
      case 'dark':
        return UserThemeType.dark;
      default:
        return UserThemeType.system;
    }
  }

  ThemeMode get themeMode {
    switch (this) {
      case UserThemeType.system:
        return ThemeMode.system;
      case UserThemeType.light:
        return ThemeMode.light;
      case UserThemeType.dark:
        return ThemeMode.dark;
    }
  }

  ThemeType themeType(BuildContext? context) {
    switch (this) {
      case UserThemeType.system:
        return (context?.platformBrightness ?? Brightness.light) ==
                Brightness.light
            ? ThemeType.light
            : ThemeType.dark;
      case UserThemeType.light:
        return ThemeType.light;
      case UserThemeType.dark:
        return ThemeType.dark;
    }
  }
}

@riverpod
class AppThemeTypeProvider extends _$AppThemeTypeProvider {
  @override
  Future<UserThemeType> build() async {
    // final storage = await ref.read(secureStorageProvider.future);

    // final themeTypeString = storage.get('userThemeType');

    // final userThemeType = UserThemeType.fromString(themeTypeString ?? '');

    // return userThemeType;

    return UserThemeType.light;
  }

  Future<void> changeThemeType(UserThemeType type) async {
    final storage = await ref.read(secureStorageProvider.future);

    await storage.set('userThemeType', type.name);

    state = AsyncValue.data(type);
  }

  void toggleThemeType() {
    final themeType = state.valueOrNull;

    final userThemeType = themeType?.themeType(null) == ThemeType.light
        ? UserThemeType.dark
        : UserThemeType.light;

    changeThemeType(userThemeType);
  }
}
