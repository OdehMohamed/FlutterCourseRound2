import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/views/pages/favorites_page.dart';
import 'package:food_delivery/views/pages/home_page.dart';
import 'package:food_delivery/views/pages/profile_page.dart';
import 'package:food_delivery/views/widgets/app_bar.dart';
import 'package:food_delivery/views/widgets/app_drawer.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;
  List<Widget> bodyWidgets = const [
    HomePage(),
    FavoritesPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey100,
      drawer: const AppDrawer(),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80), child: CustomAppBar()),
      body: SafeArea(child: bodyWidgets[selectedIndex]),
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: AppColors.primary,
        color: AppColors.secondary,
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
                color: selectedIndex == 0 ? AppColors.white : AppColors.black,
              ),
              Text(
                'Home',
                style: TextStyle(
                  color: selectedIndex == 0 ? AppColors.white : AppColors.black,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite,
                color: selectedIndex == 1 ? AppColors.white : AppColors.black,
              ),
              Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 11,
                  color: selectedIndex == 1 ? AppColors.white : AppColors.black,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.person,
                color: selectedIndex == 2 ? AppColors.white : AppColors.black,
              ),
              Text(
                'Profile',
                style: TextStyle(
                  color: selectedIndex == 2 ? AppColors.white : AppColors.black,
                ),
              ),
            ],
          ),

          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Home',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.favorite),
          //   label: 'Favorites',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: 'Profile',
          // ),
        ],
      ),
    );
  }
}
