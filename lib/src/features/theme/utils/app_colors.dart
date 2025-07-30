import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/features/theme/app_theme_type.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.colorScheme,
    required this.splashGradient,
    required this.primaryGradient,
    required this.secondaryGradient,
    required this.darkGreyText,
    required this.lightGreyText,
  });

  factory AppColors.withThemeType(ThemeType type) {
    switch (type) {
      case ThemeType.light:
        return const AppColors(
          colorScheme: _lightColorScheme,
          splashGradient: [Color(0xFF5D2D84), Color(0xFF8E5EBA)],
          primaryGradient: [
            Color.fromRGBO(57, 101, 98, 1),
            Color.fromRGBO(5, 45, 42, 1),
          ],
          secondaryGradient: [
            Color.fromRGBO(185, 163, 131, 1),
            Color.fromRGBO(148, 125, 93, 1),
          ],
          darkGreyText: Color.fromRGBO(135, 135, 135, 1),
          lightGreyText: Color.fromRGBO(194, 194, 194, 1),
        );
      case ThemeType.dark:
        return const AppColors(
          colorScheme: _darkColorScheme,
          splashGradient: [Color(0xFF5D2D84), Color(0xFF8E5EBA)],
          primaryGradient: [
            Color.fromRGBO(57, 101, 98, 1),
            Color.fromRGBO(5, 45, 42, 1),
          ],
          secondaryGradient: [
            Color.fromRGBO(185, 163, 131, 1),
            Color.fromRGBO(148, 125, 93, 1),
          ],
          darkGreyText: Color.fromRGBO(135, 135, 135, 1),
          lightGreyText: Color.fromRGBO(194, 194, 194, 1),
        );
    }
  }

  final ColorScheme colorScheme;
  final List<Color> splashGradient;
  final List<Color> primaryGradient;
  final List<Color> secondaryGradient;
  final Color darkGreyText;
  final Color lightGreyText;

  @override
  AppColors copyWith({
    ColorScheme? colorScheme,
    List<Color>? splashGradient,
    List<Color>? primaryGradient,
    List<Color>? secondaryGradient,
    Color? darkGreyText,
    Color? lightGreyText,
  }) {
    return AppColors(
      colorScheme: colorScheme ?? this.colorScheme,
      splashGradient: splashGradient ?? this.splashGradient,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      secondaryGradient: secondaryGradient ?? this.secondaryGradient,
      darkGreyText: darkGreyText ?? this.darkGreyText,
      lightGreyText: lightGreyText ?? this.lightGreyText,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      colorScheme: ColorScheme.lerp(colorScheme, other.colorScheme, t),
      splashGradient: List<Color>.generate(
        splashGradient.length,
        (index) =>
            Color.lerp(splashGradient[index], other.splashGradient[index], t)!,
      ),
      primaryGradient: List<Color>.generate(
        primaryGradient.length,
        (index) => Color.lerp(
          primaryGradient[index],
          other.primaryGradient[index],
          t,
        )!,
      ),
      secondaryGradient: List<Color>.generate(
        secondaryGradient.length,
        (index) => Color.lerp(
          secondaryGradient[index],
          other.secondaryGradient[index],
          t,
        )!,
      ),
      darkGreyText: Color.lerp(darkGreyText, other.darkGreyText, t)!,
      lightGreyText: Color.lerp(lightGreyText, other.lightGreyText, t)!,
    );
  }
}

const _lightColorScheme = ColorScheme(
  brightness: Brightness.light,

  primary: Color.fromRGBO(229, 109, 104, 1), // warm coral (was secondary)
  onPrimary: Color(0xFFFFFFFF), // white for contrast
  primaryContainer: Color.fromRGBO(
    255,
    217,
    215,
    1,
  ), // lighter coral tint (was secondaryContainer)
  onPrimaryContainer: Color.fromRGBO(
    100,
    30,
    28,
    1,
  ), // muted dark coral (was onSecondaryContainer)

  secondary: Color.fromRGBO(26, 62, 59, 1), // deep green-teal (was primary)
  onSecondary: Color(0xFFFFFFFF), // white for contrast
  secondaryContainer: Color.fromRGBO(
    200,
    228,
    226,
    1,
  ), // soft teal tint (was primaryContainer)
  onSecondaryContainer: Color.fromRGBO(
    0,
    30,
    28,
    1,
  ), // darkened variant (was onPrimaryContainer)

  tertiary: Color(0xFF00796B), // Complement of primary (deeper cyan green)
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFA7FFEB), // pastel mint
  onTertiaryContainer: Color(0xFF00332C), // deep teal

  error: Colors.red, // red-ish version of secondary
  onError: Color(0xFFFFFFFF),
  errorContainer: Color.fromRGBO(255, 217, 213, 1),
  onErrorContainer: Color.fromRGBO(85, 0, 0, 1),

  // surface: Color(0xFFFFFFFF), // standard light surface
  surface: Color.fromRGBO(249, 250, 252, 1), // pure white
  onSurface: Color.fromRGBO(33, 33, 33, 1), // neutral dark
  surfaceContainerLow: Color.fromRGBO(243, 243, 243, 1),
  surfaceContainer: Color.fromRGBO(255, 255, 255, 1),
  surfaceContainerHighest: Color.fromRGBO(225, 225, 225, 1),

  outline: Color.fromRGBO(237, 237, 237, 1),
  shadow: Color.fromRGBO(0, 0, 0, 0.2),
  inverseSurface: Color(0xFF333333),
  onInverseSurface: Color(0xFFF8F8F8),
);

const _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,

  primary: Color.fromRGBO(255, 217, 215, 1), // light coral tint (was secondary)
  onPrimary: Color.fromRGBO(100, 30, 28, 1), // dark coral (was onSecondary)
  primaryContainer: Color.fromRGBO(
    229,
    109,
    104,
    1,
  ), // original coral (was secondaryContainer)
  onPrimaryContainer: Color(
    0xFFFFEBEB,
  ), // near white (was onSecondaryContainer)

  secondary: Color.fromRGBO(
    200,
    228,
    226,
    1,
  ), // light tint of teal (was primary)
  onSecondary: Color.fromRGBO(0, 30, 28, 1), // very dark teal (was onPrimary)
  secondaryContainer: Color.fromRGBO(
    26,
    62,
    59,
    1,
  ), // original teal (was primaryContainer)
  onSecondaryContainer: Color(
    0xFFE0F2F1,
  ), // light for contrast (was onPrimaryContainer)

  tertiary: Color(0xFF80CBC4), // soft teal complement
  onTertiary: Color(0xFF002620),
  tertiaryContainer: Color(0xFF004D40), // dark muted teal
  onTertiaryContainer: Color(0xFFA7FFEB),

  error: Color.fromRGBO(255, 180, 170, 1),
  onError: Color.fromRGBO(85, 0, 0, 1),
  errorContainer: Color.fromRGBO(229, 77, 66, 1),
  onErrorContainer: Color(0xFFFFEBEB),

  surface: Color(0xFF121212), // base dark surface
  onSurface: Color(0xFFE0E0E0),
  surfaceContainerLow: Color(0xFF1E1E1E),
  surfaceContainer: Color(0xFF2C2C2C),
  surfaceContainerHighest: Color(0xFF383838),

  background: Color(0xFF101010),
  onBackground: Color(0xFFF5F5F5),
  outline: Color(0xFF888888),
  shadow: Color.fromRGBO(0, 0, 0, 0.6),
  inverseSurface: Color(0xFFEAEAEA),
  onInverseSurface: Color(0xFF121212),
);
