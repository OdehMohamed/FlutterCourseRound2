import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoListSection.insetGrouped(
          margin: const EdgeInsets.only(left: 8, right: 8, top: 20),
          backgroundColor: AppColors.grey2.withOpacity(0.5),
          header: const Text("General"),
          children: [
            CupertinoListTile(
              onTap: () {},
              leading: const Icon(
                Icons.person_outline,
              ),
              title: const Text(
                "Edit profile",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            CupertinoListTile(
              onTap: () {},
              leading: const Icon(
                Icons.lock_outline,
              ),
              title: const Text(
                "Change password",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            CupertinoListTile(
              onTap: () {},
              leading: const Icon(
                Icons.notifications_none,
              ),
              title: const Text(
                "Notifications",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            CupertinoListTile(
              onTap: () {},
              leading: const Icon(
                Icons.security,
              ),
              title: const Text(
                "Security",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            CupertinoListTile(
              onTap: () {},
              leading: const Icon(
                Icons.language,
              ),
              title: const Text(
                "Language",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          ],
        ),
        CupertinoListSection.insetGrouped(
            margin: const EdgeInsets.only(left: 8, right: 8, top: 20),
            backgroundColor: AppColors.grey2.withOpacity(0.5),
            header: const Text("Preferences"),
            children: [
              CupertinoListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.policy_outlined,
                ),
                title: const Text(
                  "Legal and polices",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
              CupertinoListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.live_help_outlined,
                ),
                title: const Text(
                  "Help and support",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
              CupertinoListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.red),
                ),
              ),
            ]),
      ],
    );
  }
}
