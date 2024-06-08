import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const Text("Home Options"),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              subtitle: const Text(
                "home page",
                style: TextStyle(fontSize: 10),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
