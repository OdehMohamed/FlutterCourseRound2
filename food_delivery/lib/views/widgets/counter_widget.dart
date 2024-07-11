import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';

class CounterWidget extends StatefulWidget {
  // final int counter;
  static int counter = 1;

  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int counter;
  @override
  void initState() {
    super.initState();
    counter = 1;
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            color: AppColors.primary,
            onPressed: counter > 1
                ? () {
                    setState(() {
                      counter--;
                    });
                  }
                : null,
          ),
          Text(
            counter.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
              icon: const Icon(Icons.add),
              color: AppColors.primary,
              onPressed: () {
                setState(() {
                  counter++;
                });
              }),
        ],
      ),
    );
  }
}
