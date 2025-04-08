

import 'package:dae/core/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    textTheme: TTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: TTextTheme.darkTextTheme,
  );
}
