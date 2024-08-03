import 'package:e_commerce/utils/app_constants.dart';
import 'package:e_commerce/utils/app_theme.dart';
import 'package:e_commerce/views/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: AppTheme.lightTheme(),
      home: const CustomBottomNavBar(),
    );
  }
}
