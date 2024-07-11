import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';

class PropertyItem extends StatelessWidget {
  final String title;
  final String value;
  const PropertyItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              title,
              style: const TextStyle(color: AppColors.grey),
            ),
            const SizedBox(width: 10),
            Text(value),
          ],
        ),
      ],
    );
  }
}
