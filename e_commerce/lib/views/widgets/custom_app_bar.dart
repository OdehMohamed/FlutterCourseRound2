import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final int index;
  const CustomAppBar({super.key, required this.index});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: widget.index == 0 ? false : true,
      leading: const Padding(
        padding: EdgeInsets.only(left: 8, top: 8, right: 0),
        child: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
              'https://cdn-icons-png.flaticon.com/512/5556/5556499.png'),
        ),
      ),
      title: titleAppBar(context, widget.index),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
      ],
    );
  }
}

Widget titleAppBar(BuildContext context, int index) {
  switch (index) {
    case 1:
      return const Text("Cart");
    case 2:
      return const Text("Favorite");
    case 3:
      return const Text("Settings");
    default:
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Hi, Mohamed",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text("Let's go shopping",
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.grey,
                )),
      ]);
  }
}
