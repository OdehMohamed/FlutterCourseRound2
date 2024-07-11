import 'package:flutter/material.dart';
import 'package:food_delivery/functions/is_arabic_language.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/views/pages/custom_bottom_navbar.dart';
import 'package:food_delivery/views/widgets/app_drawer.dart';
import 'package:intl/intl.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = "/settings_page";
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedLanguage = Intl.getCurrentLocale();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        // backgroundColor: AppColors.secondary2,
        title: Text(
          isArabic() == false ? 'Settings' : 'الاعدادات',
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isArabic() == false ? 'Choose your Language' : "اختر لغتك",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              width: 20,
            ),
            DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != _selectedLanguage) {
                    _selectedLanguage = newValue!;
                    MyApp.of(context)!.setLocale();
                    Navigator.of(context)
                        .pushNamed(CustomBottomNavBar.routeName);
                  }
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'en',
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: 'ar',
                  child: Text('العربية'),
                ),
                // Add more language options as needed
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
