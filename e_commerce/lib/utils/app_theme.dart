import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.onPrimary,
          shadowColor: AppColors.black,
          // elevation: 5,
        ),
        textTheme: const TextTheme(),
        useMaterial3: true,
      );
}
