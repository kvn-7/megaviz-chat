// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:megaviz_chat/src/features/theme/app_theme_type.dart';
import 'package:megaviz_chat/src/features/theme/utils/app_colors.dart';
import 'package:megaviz_chat/src/features/theme/utils/app_ui_utils.dart';

export 'package:megaviz_chat/src/features/theme/app_theme_type.dart';
export 'package:megaviz_chat/src/features/theme/utils/app_colors.dart';
export 'package:megaviz_chat/src/features/theme/utils/app_ui_utils.dart';

class AppTheme {
  static ThemeData getTheme({required ThemeType type}) {
    final colors = AppColors.withThemeType(type);
    final uiUtils = AppUiUtils.primary(colors.colorScheme);
    final fontFamily = uiUtils.fontFamily;

    return ThemeData(
      useMaterial3: true,
      brightness: type == ThemeType.dark ? Brightness.dark : Brightness.light,
      extensions: [colors, uiUtils],
      fontFamily: fontFamily,
      scaffoldBackgroundColor: colors.colorScheme.surface,
      drawerTheme: DrawerThemeData(
        shape: const RoundedRectangleBorder(),
        backgroundColor: colors.colorScheme.surface,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(uiUtils.bottomSheetBorderRadius),
          ),
        ),
        showDragHandle: true,
        backgroundColor: colors.colorScheme.surfaceContainer,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: const CircleBorder(),
        backgroundColor: colors.colorScheme.primary,
        foregroundColor: colors.colorScheme.onPrimary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: uiUtils.cardElevation,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: colors.colorScheme.surfaceContainer,
        selectedLabelStyle: TextStyle(
          fontFamily: uiUtils.fontFamily,
          fontWeight: FontWeight.w600,
          color: colors.colorScheme.primary,
        ),
        unselectedLabelStyle: TextStyle(fontFamily: uiUtils.fontFamily),
      ),
      bottomAppBarTheme: BottomAppBarTheme(elevation: uiUtils.cardElevation),
      colorScheme: colors.colorScheme,
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(uiUtils.borderRadius),
        ),
        margin: EdgeInsets.zero,
        elevation: uiUtils.cardElevation,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: uiUtils.fontHeight,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: uiUtils.fontHeight,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: uiUtils.fontHeight,
        ),
        bodyLarge: TextStyle(height: uiUtils.fontHeight),
        bodyMedium: TextStyle(height: uiUtils.fontHeight),
      ),
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        color: colors.colorScheme.surface,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colors.colorScheme.onSurface,
        ),
        titleSpacing: 12,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: colors.colorScheme.surface,
          statusBarColor: colors.colorScheme.surface,
          statusBarIconBrightness: type == ThemeType.dark
              ? Brightness.light
              : Brightness.dark,
          statusBarBrightness: type == ThemeType.dark
              ? Brightness.dark
              : Brightness.light,
        ),
      ),
      iconTheme: const IconThemeData(),
      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom()),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(uiUtils.borderRadius),
          ),
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          textStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(uiUtils.borderRadius),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(uiUtils.borderRadius),
          ),
          // padding: const EdgeInsets.symmetric(
          //   horizontal: 4,
          //   vertical: 4,
          // ),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: const TextStyle(
            fontSize: 16,
            // decoration: TextDecoration.underline,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(uiUtils.borderRadius),
          borderSide: BorderSide(
            color: colors.colorScheme.onSurface,
            width: 0.2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(uiUtils.borderRadius),
          borderSide: BorderSide(
            color: colors.colorScheme.onSurface,
            width: 0.2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(uiUtils.borderRadius),
          borderSide: BorderSide(color: colors.colorScheme.primary),
        ),
      ),
      tabBarTheme: TabBarThemeData(
        indicatorSize: TabBarIndicatorSize.label,
        tabAlignment: TabAlignment.start,
        labelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      dividerTheme: const DividerThemeData(thickness: 0.5),
      chipTheme: ChipThemeData(
        secondaryLabelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          color: colors.colorScheme.onSurface,
        ),
        labelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          color: colors.colorScheme.onSurface,
        ),
        side: const BorderSide(width: 0.2),
        backgroundColor: colors.colorScheme.surface,
        selectedColor: colors.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(uiUtils.borderRadius),
        ),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          color: colors.colorScheme.onSurface,
        ),
      ),
      popupMenuTheme: const PopupMenuThemeData(
        menuPadding: EdgeInsets.zero,
        iconSize: 20,
      ),
      menuButtonTheme: MenuButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: uiUtils.cardElevation,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          // padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(uiUtils.borderRadius),
          ),
        ),
      ),
    );
  }
}
