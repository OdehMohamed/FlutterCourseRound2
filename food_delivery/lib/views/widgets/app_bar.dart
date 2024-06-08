import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.secondary2,
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
      //backgroundColor: AppColors.green,
      title: const Column(
        children: <Widget>[
          Text(
            'Current Location',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 14,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: AppColors.green,
              ),
              Text("Palestine, Jerusalem",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
