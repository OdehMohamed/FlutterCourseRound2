import 'package:e_commerce/views/widgets/category_tab_inner_page.dart';
import 'package:e_commerce/views/widgets/home_tab_inner_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(dividerHeight: 0, tabs: [
              Tab(
                text: "Home",
              ),
              Tab(
                text: "Category",
              ),
            ]),
            Expanded(
              child: TabBarView(children: [
                HomeTabInnerPage(),
                CategoryTabInnerPage(),
              ]),
            ),
          ],
        ));
  }
}
