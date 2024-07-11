import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/coupon_model.dart';
import 'package:food_delivery/models/order_model.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/views/pages/coupons_page.dart';
import 'package:food_delivery/views/pages/orders_page.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = "/profile_page";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 270,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                                'assets/images/developer_banner.jpg'),
                          ),
                          Positioned(
                            top: 125,
                            left: 140,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  width: 3,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/images/iam.jpg',
                                  scale: 5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Mohamed Odeh Hleesi",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "Junior Mobile App Developer",
                      // style: Theme.of(context).textTheme.bodyMedium,
                      style: TextStyle(fontSize: 16, color: AppColors.grey),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Orders",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${orderList.length}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                          child: VerticalDivider(
                            width: 20,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Coupons',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${dummyCoupons.length}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ),
          CupertinoListSection.insetGrouped(
            margin: EdgeInsets.only(left: 8, right: 8, top: 20),
            backgroundColor: Theme.of(context).colorScheme.background,
            children: [
              CupertinoListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(OrdersPage.routeName);
                },
                leading: Icon(
                  Icons.shopping_cart_outlined,
                ),
                title: Text(
                  "Orders",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                trailing: Row(
                  children: [
                    Text(
                      '${orderList.length}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(0.5)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ],
                ),
              ),
              CupertinoListTile(
                onTap: () {
                  setState(() {
                    Navigator.of(context).pushNamed(CouponsPage.routeName);
                  });
                },
                leading: Icon(
                  Icons.card_giftcard_rounded,
                ),
                title: Text(
                  "Coupons",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                trailing: Row(
                  children: [
                    Text(
                      '${dummyCoupons.length}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(0.5)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
