import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          onPrimary: AppColors.white,
          secondary: AppColors.secondary,
          onSecondary: AppColors.black,
          background: AppColors.secondary2,
          brightness: Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.secondary2,
          elevation: 0.5,
          shadowColor: AppColors.black,
        ),
        drawerTheme: DrawerThemeData(backgroundColor: AppColors.secondary2),
        iconTheme: IconThemeData(
          color: AppColors.primary,
        ),
        useMaterial3: true,
      );
  static ThemeData darkTheme() => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.black,
          primary: AppColors.black,
          onPrimary: AppColors.grey,
          secondary: AppColors.black,
          onSecondary: AppColors.primary.withRed(180),
          background: AppColors.black,
          brightness: Brightness.dark,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.black,
          foregroundColor: AppColors.primary.withRed(180),
          elevation: 0.5,
          shadowColor: AppColors.black,
        ),
        drawerTheme: DrawerThemeData(backgroundColor: AppColors.black),
        iconTheme: IconThemeData(
          color: AppColors.primary.withRed(180),
        ),
        useMaterial3: true,
      );
}
