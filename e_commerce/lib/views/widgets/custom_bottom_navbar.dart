import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/views/pages/favorite_page.dart';
import 'package:e_commerce/views/pages/home_page.dart';
import 'package:e_commerce/views/pages/cart_page.dart';
import 'package:e_commerce/views/pages/settings_page.dart';
import 'package:e_commerce/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight((size.height * 0.08)),
          child: CustomAppBar(
            index: _currentIndex,
          )),
      body: PersistentTabView(
        stateManagement: false,
        onTabChanged: (value) => setState(() {
          _currentIndex = value;
        }),
        tabs: [
          PersistentTabConfig(
            screen: const HomePage(),
            item: ItemConfig(
              icon: const Icon(Icons.home),
              title: "Home",
              activeForegroundColor: Theme.of(context).primaryColor,
              inactiveForegroundColor: AppColors.secondary,
            ),
          ),
          PersistentTabConfig(
            screen: const CartPage(),
            item: ItemConfig(
              icon: const Icon(Icons.shopping_cart),
              title: "Cart",
              activeForegroundColor: Theme.of(context).primaryColor,
              inactiveForegroundColor: AppColors.secondary,
            ),
          ),
          PersistentTabConfig(
            screen: const FavoritePage(),
            item: ItemConfig(
              icon: const Icon(Icons.favorite),
              title: "Favorite",
              activeForegroundColor: Theme.of(context).primaryColor,
              inactiveForegroundColor: AppColors.secondary,
            ),
          ),
          PersistentTabConfig(
            screen: const SettingsPage(),
            item: ItemConfig(
              icon: const Icon(Icons.settings),
              title: "Settings",
              activeForegroundColor: Theme.of(context).primaryColor,
              inactiveForegroundColor: AppColors.secondary,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style8BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}
