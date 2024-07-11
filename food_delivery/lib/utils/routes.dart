import 'package:flutter/material.dart';
import 'package:food_delivery/views/pages/cart_page.dart';
import 'package:food_delivery/views/pages/contact_us_page.dart';
import 'package:food_delivery/views/pages/coupons_page.dart';
import 'package:food_delivery/views/pages/custom_bottom_navbar.dart';
import 'package:food_delivery/views/pages/home_page.dart';
import 'package:food_delivery/views/pages/orders_page.dart';
import 'package:food_delivery/views/pages/product_details_page.dart';
import 'package:food_delivery/views/pages/profile_page.dart';
import 'package:food_delivery/views/pages/settings_page.dart';

Map<String, Widget Function(BuildContext)> allRoutes = {
  ProductDetailsPage.routeName: (context) => ProductDetailsPage(),
  CustomBottomNavBar.routeName: (context) => CustomBottomNavBar(),
  SettingsPage.routeName: (context) => SettingsPage(),
  HomePage.routeName: (context) => CustomBottomNavBar(),
  ProfilePage.routeName: (context) => ProfilePage(),
  ContactUsPage.routeName: (context) => ContactUsPage(),
  CartPage.routeName: (context) => CartPage(),
  OrdersPage.routeName: (context) => OrdersPage(),
  CouponsPage.routeName: (context) => CouponsPage(),
};
