import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/features/theme/app_theme.dart';
import 'package:megaviz_chat/src/l10n/app_localizations.dart';

extension BuildContextX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  AppUiUtils get appUiUtils => Theme.of(this).extension<AppUiUtils>()!;

  AppColors get appColors => Theme.of(this).extension<AppColors>()!;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  AppLocalizations get appLocalizations => AppLocalizations.of(this)!;

  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(
    String? text,
  ) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: colorScheme.error,
      content: Text(
        text ?? appLocalizations.somethingWentWrong,
        style: textTheme.bodyMedium?.copyWith(color: colorScheme.onError),
      ),
    ),
  );

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnackBar(
    String text,
  ) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      content: Text(
        text,
        style: textTheme.bodyMedium?.copyWith(color: Colors.white),
      ),
    ),
  );
}
