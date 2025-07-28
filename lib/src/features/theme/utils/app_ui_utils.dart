import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class AppUiUtils extends ThemeExtension<AppUiUtils> {
  const AppUiUtils({
    required this.borderRadius,
    required this.cardElevation,
    required this.bottomSheetBorderRadius,
    required this.fontFamily,
    required this.secondaryFontFamily,
    required this.bottomNavIconSize,
    required this.monthPickerDialogSettings,
    required this.fontHeight,
  });

  factory AppUiUtils.primary(ColorScheme colorScheme) {
    return AppUiUtils(
      borderRadius: 12,
      cardElevation: 3,
      bottomSheetBorderRadius: 24,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      secondaryFontFamily: GoogleFonts.openSans().fontFamily,
      bottomNavIconSize: 28,
      fontHeight: 1.2,
      monthPickerDialogSettings: MonthPickerDialogSettings(
        dialogSettings: PickerDialogSettings(
          dialogBackgroundColor: colorScheme.surface,
          dialogRoundedCornersRadius: 12,
        ),
        dateButtonsSettings: PickerDateButtonsSettings(
          buttonBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          selectedMonthBackgroundColor: colorScheme.primary,
          selectedMonthTextColor: colorScheme.onPrimary,
        ),
      ),
    );
  }

  final double borderRadius;
  final double cardElevation;
  final double bottomSheetBorderRadius;
  final String? fontFamily;
  final String? secondaryFontFamily;
  final double bottomNavIconSize;
  final MonthPickerDialogSettings monthPickerDialogSettings;
  final double fontHeight;

  @override
  AppUiUtils copyWith({
    double? borderRadius,
    double? cardElevation,
    double? bottomSheetBorderRadius,
    String? fontFamily,
    String? secondaryFontFamily,
    double? bottomNavIconSize,
    MonthPickerDialogSettings? monthPickerDialogSettings,
    double? fontHeight,
  }) {
    return AppUiUtils(
      borderRadius: borderRadius ?? this.borderRadius,
      cardElevation: cardElevation ?? this.cardElevation,
      bottomSheetBorderRadius:
          bottomSheetBorderRadius ?? this.bottomSheetBorderRadius,
      fontFamily: fontFamily ?? this.fontFamily,
      secondaryFontFamily: secondaryFontFamily ?? this.secondaryFontFamily,
      bottomNavIconSize: bottomNavIconSize ?? this.bottomNavIconSize,
      monthPickerDialogSettings:
          monthPickerDialogSettings ?? this.monthPickerDialogSettings,
      fontHeight: fontHeight ?? this.fontHeight,
    );
  }

  @override
  AppUiUtils lerp(ThemeExtension<AppUiUtils>? other, double t) {
    if (other is! AppUiUtils) {
      return this;
    }

    return AppUiUtils(
      borderRadius: other.borderRadius,
      cardElevation: other.cardElevation,
      bottomSheetBorderRadius: other.bottomSheetBorderRadius,
      fontFamily: other.fontFamily,
      secondaryFontFamily: other.secondaryFontFamily,
      bottomNavIconSize: other.bottomNavIconSize,
      monthPickerDialogSettings: other.monthPickerDialogSettings,
      fontHeight: other.fontHeight,
    );
  }
}
