import 'package:flutter/material.dart';
import 'package:food_delivery/functions/is_arabic_language.dart';
import 'package:food_delivery/views/pages/contact_us_page.dart';
import 'package:food_delivery/views/pages/home_page.dart';
import 'package:food_delivery/views/pages/settings_page.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/iam.jpg',
                  scale: 10,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              !isArabic() ? "Mohamed Odeh" : "محمد عودة",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Divider(
              height: 0,
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(!isArabic() ? "Home" : "الرئيسية"),
              subtitle: Text(
                !isArabic() ? "home page" : "الصفحة الرئيسية",
                style: TextStyle(fontSize: 10),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(HomePage.routeName);
              },
            ),
            Divider(
              height: 0,
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(!isArabic() ? "Profile" : "الملف الشخصي"),
              subtitle: Text(
                !isArabic() ? "my profile" : "الملف الشخصي",
                style: TextStyle(fontSize: 10),
              ),
              onTap: () {},
            ),
            Divider(
              height: 0,
            ),
            ListTile(
              leading: const Icon(Icons.contact_page_outlined),
              title: Text(!isArabic() ? "Contact us" : "تواصل معنا"),
              subtitle: Text(
                !isArabic() ? "contact information" : "معلومات التواصل",
                style: TextStyle(fontSize: 10),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(ContactUsPage.routeName);
              },
            ),
            Divider(
              height: 0,
            ),
            Divider(
              height: 0,
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(!isArabic() ? "Settings" : "الاعدادات"),
              subtitle: Text(
                !isArabic() ? "settings page" : "صفحةالاعدادات",
                style: TextStyle(fontSize: 10),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(SettingsPage.routeName);
              },
            ),
            Divider(
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
