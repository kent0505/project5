import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.grey,
  fontFamily: 'SFPro',
  // textSelectionTheme: const TextSelectionThemeData(
  //   cursorColor: AppColors.accent,
  //   selectionColor: AppColors.accent,
  //   selectionHandleColor: AppColors.accent,
  // ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: AppColors.activeNavBar,
  ),
);
