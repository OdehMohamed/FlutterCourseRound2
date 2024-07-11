import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/generated/l10n.dart';
import 'package:food_delivery/views/pages/favorites_page.dart';
import 'package:food_delivery/views/pages/home_page.dart';
import 'package:food_delivery/views/pages/profile_page.dart';
import 'package:food_delivery/views/widgets/app_bar.dart';
import 'package:food_delivery/views/widgets/app_drawer.dart';

class CustomBottomNavBar extends StatefulWidget {
  static const String routeName = '/custom_bottom_nav';
  const CustomBottomNavBar({super.key});
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with WidgetsBindingObserver {
  int selectedIndex = 0;
  List<Widget> bodyWidgets = const [
    HomePage(),
    FavoritesPage(),
    ProfilePage(),
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      debugPrint('Resumed');
    }
    if (state == AppLifecycleState.inactive) {
      debugPrint('Inactive');
    }
    if (state == AppLifecycleState.paused) {
      debugPrint('Paused');
    }
    if (state == AppLifecycleState.detached) {
      debugPrint('Detached');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.grey100,
      drawer: const AppDrawer(),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80), child: CustomAppBar()),
      body: SafeArea(child: bodyWidgets[selectedIndex]),
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Theme.of(context).primaryColor,
        color: Theme.of(context).colorScheme.secondary,
        // buttonBackgroundColor: AppColors.primary,
        // color: AppColors.secondary,
        animationDuration: const Duration(seconds: 1),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.home,
                color: selectedIndex == 0
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSecondary,
              ),
              selectedIndex != 0
                  ? Text(
                      S.of(context).Home,
                      style: TextStyle(
                        color: selectedIndex == 0
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
                    )
                  : const Center(),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite,
                color: selectedIndex == 1
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSecondary,
              ),
              selectedIndex != 1
                  ? Text(
                      S.of(context).Favorites,
                      style: TextStyle(
                        fontSize: 11,
                        color: selectedIndex == 1
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
                    )
                  : const Center(),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.person,
                color: selectedIndex == 2
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSecondary,
              ),
              selectedIndex != 2
                  ? Text(
                      S.of(context).Profile,
                      style: TextStyle(
                        color: selectedIndex == 2
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
                    )
                  : const Center(),
            ],
          ),
        ],
      ),
    );
  }
}
