import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static Color get bgEnablePrimaryButton => _AppSolidColors().primary;
  static Color get textEnablePrimaryButton => _AppSolidColors().white;

  static Color get bgEnableSecondaryButton => _AppSolidColors().transparent;
  static Color get borderEnableSecondaryButton => _AppSolidColors().black;
  static Color get textEnableSecondaryButton => _AppSolidColors().black;

  static Color get textTitle => _AppSolidColors().black;
  static Color get textSubtitle => _AppSolidColors().gray;

  static Color get navBarTitle => _AppSolidColors().black;

  static RadialGradient get bgPageRadialGradient =>
      _AppRadialGradients().primary;
}

class _AppSolidColors {
  const _AppSolidColors();

  Color get primary => const Color(0xFF006C49);
  Color get black => const Color(0xFF3C4A42);
  Color get gray => const Color(0xFF0D1C2F);
  Color get white => const Color(0xFFFFFFFF);
  Color get transparent => const Color(0x00FFFFFF);
}

class _AppRadialGradients {
  const _AppRadialGradients();

  RadialGradient get primary => RadialGradient(
    center: Alignment(0.0, -0.6),
    radius: 1.2,
    colors: [
      Color(0xFF6FFBBE).withValues(alpha: 0.45),
      Color(0xFF6FFBBE).withValues(alpha: 0.15),
    ],
    stops: [0.0, 1.0],
  );
}
