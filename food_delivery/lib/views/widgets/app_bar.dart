import 'package:flutter/material.dart';
import 'package:food_delivery/generated/l10n.dart';
import 'package:food_delivery/utils/app_colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: AppColors.secondary2,
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
      //backgroundColor: AppColors.green,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            S.of(context).titleAppBar1,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 14,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.location_on,
                color: AppColors.green,
              ),
              Text(S.of(context).titleAppBar2,
                  style: const TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
