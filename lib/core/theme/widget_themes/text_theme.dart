import 'package:dae/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// Custom Class for Light & Dark Text Themes
class TTextTheme {
  TTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontFamily: 'tajawal',
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      color: AppColors.dark,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontFamily: 'tajawal',

      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.dark,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontFamily: 'tajawal',

      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.dark,
    ),
    titleLarge: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.dark,
    ),
    titleMedium: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.dark,
    ),
    titleSmall: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.dark,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.dark,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.dark,
    ),
    bodySmall: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.dark.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.dark,
    ),
    labelMedium: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.dark.withOpacity(0.5),
    ),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontFamily: 'tajawal',

      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      color: AppColors.light,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontFamily: 'tajawal',

      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.light,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontFamily: 'tajawal',

      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.light,
    ),
    titleLarge: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.light,
    ),
    titleMedium: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.light,
    ),
    titleSmall: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.light,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.light,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.light,
    ),
    bodySmall: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.light.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.light,
    ),
    labelMedium: const TextStyle().copyWith(
      fontFamily: 'cairo',

      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.light.withOpacity(0.5),
    ),
  );
}
