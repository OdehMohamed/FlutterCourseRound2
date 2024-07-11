// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get Favorites {
    return Intl.message(
      'Favorites',
      name: 'Favorites',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Current Location`
  String get titleAppBar1 {
    return Intl.message(
      'Current Location',
      name: 'titleAppBar1',
      desc: '',
      args: [],
    );
  }

  /// `Palestine, jerusalem`
  String get titleAppBar2 {
    return Intl.message(
      'Palestine, jerusalem',
      name: 'titleAppBar2',
      desc: '',
      args: [],
    );
  }

  /// `Find your food`
  String get searchHintText {
    return Intl.message(
      'Find your food',
      name: 'searchHintText',
      desc: '',
      args: [],
    );
  }

  /// `Burger`
  String get categoryName1 {
    return Intl.message(
      'Burger',
      name: 'categoryName1',
      desc: '',
      args: [],
    );
  }

  /// `Taco`
  String get categoryName2 {
    return Intl.message(
      'Taco',
      name: 'categoryName2',
      desc: '',
      args: [],
    );
  }

  /// `Pizza`
  String get categoryName3 {
    return Intl.message(
      'Pizza',
      name: 'categoryName3',
      desc: '',
      args: [],
    );
  }

  /// `Chicken`
  String get categoryName4 {
    return Intl.message(
      'Chicken',
      name: 'categoryName4',
      desc: '',
      args: [],
    );
  }

  /// `Drinks`
  String get categoryName5 {
    return Intl.message(
      'Drinks',
      name: 'categoryName5',
      desc: '',
      args: [],
    );
  }

  /// `Beef Burger`
  String get product1 {
    return Intl.message(
      'Beef Burger',
      name: 'product1',
      desc: '',
      args: [],
    );
  }

  /// `Chicken Burger`
  String get product2 {
    return Intl.message(
      'Chicken Burger',
      name: 'product2',
      desc: '',
      args: [],
    );
  }

  /// `Cheese Burger`
  String get product3 {
    return Intl.message(
      'Cheese Burger',
      name: 'product3',
      desc: '',
      args: [],
    );
  }

  /// `Chicken Pizza`
  String get product4 {
    return Intl.message(
      'Chicken Pizza',
      name: 'product4',
      desc: '',
      args: [],
    );
  }

  /// `Margreta Pizza`
  String get product5 {
    return Intl.message(
      'Margreta Pizza',
      name: 'product5',
      desc: '',
      args: [],
    );
  }

  /// `Lazania`
  String get product6 {
    return Intl.message(
      'Lazania',
      name: 'product6',
      desc: '',
      args: [],
    );
  }

  /// `Koshary`
  String get product7 {
    return Intl.message(
      'Koshary',
      name: 'product7',
      desc: '',
      args: [],
    );
  }

  /// `Fried Chicken`
  String get product8 {
    return Intl.message(
      'Fried Chicken',
      name: 'product8',
      desc: '',
      args: [],
    );
  }

  /// `Grilled Chicken`
  String get product9 {
    return Intl.message(
      'Grilled Chicken',
      name: 'product9',
      desc: '',
      args: [],
    );
  }

  String productName(int index) {
    String result = Intl.message("");
    switch (index) {
      case 1:
        result = product1;
        break;
      case 2:
        result = product2;
        break;
      case 3:
        result = product3;
        break;
      case 4:
        result = product4;
        break;
      case 5:
        result = product5;
        break;
      case 6:
        result = product6;
        break;
      case 7:
        result = product7;
        break;
      case 8:
        result = product8;
        break;
      case 9:
        result = product9;
        break;
    }
    return result;
  }

  String categoryName(int index) {
    String result = Intl.message("");
    switch (index) {
      case 1:
        result = categoryName1;
        break;
      case 2:
        result = categoryName2;
        break;
      case 3:
        result = categoryName3;
        break;
      case 4:
        result = categoryName4;
        break;
      case 5:
        result = categoryName5;
        break;
    }
    return result;
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
