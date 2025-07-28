import 'package:megaviz_chat/src/features/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({required this.colorScheme, required this.splashGradient});

  factory AppColors.withThemeType(ThemeType type) {
    switch (type) {
      case ThemeType.light:
        return const AppColors(
          colorScheme: _lightColorScheme,
          splashGradient: [Color(0xFF5D2D84), Color(0xFF8E5EBA)],
        );
      case ThemeType.dark:
        return const AppColors(
          colorScheme: _darkColorScheme,
          splashGradient: [Color(0xFF5D2D84), Color(0xFF8E5EBA)],
        );
    }
  }

  final ColorScheme colorScheme;
  final List<Color> splashGradient;

  @override
  AppColors copyWith({ColorScheme? colorScheme, List<Color>? splashGradient}) {
    return AppColors(
      colorScheme: colorScheme ?? this.colorScheme,
      splashGradient: splashGradient ?? this.splashGradient,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      colorScheme: ColorScheme.lerp(colorScheme, other.colorScheme, t),
      splashGradient: splashGradient,
    );
  }
}

const _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF5D2D84), // Rich purple-indigo for branding
  onPrimary: Color(0xFFFFFFFF), // Text on primary color
  primaryContainer: Color(0xFFE5D8F0), // Soft lavender container
  secondary: Color(0xFFFF5722), // Bold orange for accents
  onSecondary: Color(0xFFFFFFFF), // Text on secondary
  tertiary: Color(0xFF009688), // Teal for additional accent
  onTertiary: Color(0xFFFFFFFF), // Text on tertiary
  error: Color(0xFFD85140), // Bright red for errors
  onError: Color(0xFFFFFFFF), // Text on error
  errorContainer: Color(0xFFFFDAD5), // Light red container
  onErrorContainer: Color(0xFF410001), // Text on error container
  // surface: Color(0xFFF8F5FB), // Very light lavender for surfaces
  surface: Color.fromARGB(
    255,
    255,
    255,
    255,
  ), // Very light lavender for surfaces
  onSurface: Color(0xFF333333), // Text on surface
  surfaceContainerLow: Color(0xFFF1ECF8), // Low container level
  surfaceContainer: Color.fromARGB(255, 253, 248, 255),
  surfaceContainerHighest: Color(0xFFEDE6F5), // Highest container level
);

const _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color.fromARGB(
    255,
    164,
    83,
    164,
  ), // Adjusted for better contrast in dark theme
  onPrimary: Color(0xFFFFFFFF), // Text on primary color
  primaryContainer: Color(0xFF6A4C99), // Darker shade of lavender container
  onPrimaryContainer: Color(0xFF1F1B2D), // Text on primary container
  secondary: Color(0xFFFF5722), // Bold orange for accents
  onSecondary: Color(0xFFFFFFFF), // Text on secondary
  tertiary: Color(0xFF009688), // Teal for additional accent
  onTertiary: Color(0xFFFFFFFF), // Text on tertiary
  error: Color(0xFFD85140), // Bright red for errors
  onError: Color(0xFFFFFFFF), // Text on error
  errorContainer: Color(0xFF9E2B24), // Darker red container
  onErrorContainer: Color(0xFFFFDAD5), // Text on error container
  surface: Color(0xFF2C2C2C), // Dark surface color
  // onSurface: Color(0xFFE0E0E0), // Light text on dark surface
  onSurface: Color(0xFFFFFFFF), // Light text on dark surface
  surfaceContainerLow: Color(0xFF3A3A3A), // Low container level
  surfaceContainer: Color(0xFF444444), // Regular container level
  surfaceContainerHighest: Color(0xFF4D4D4D), // Highest container level
);
