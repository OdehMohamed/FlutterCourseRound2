import 'package:flutter/material.dart';
import 'package:food_delivery/generated/l10n.dart';
import 'package:food_delivery/utils/app_theme.dart';
import 'package:food_delivery/utils/routes.dart';
import 'package:food_delivery/views/pages/custom_bottom_navbar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<_MyAppState> appKey = GlobalKey<_MyAppState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void setLocale() {
    setState(() {
      if (_locale == const Locale('en')) {
        _locale = const Locale('ar');
      } else {
        _locale = const Locale('en');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: appKey,
      locale: _locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      routes: allRoutes,
      home: const CustomBottomNavBar(),
    );
  }
}
