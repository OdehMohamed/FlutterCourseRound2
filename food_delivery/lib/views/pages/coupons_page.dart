import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/models/coupon_model.dart';
import 'package:food_delivery/models/order_model.dart';
import 'package:food_delivery/models/product_model.dart';

class CouponsPage extends StatefulWidget {
  static final String routeName = "/coupons_page";
  const CouponsPage({super.key});

  @override
  State<CouponsPage> createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          title: Text('Coupons'),
        ),
        body: SafeArea(
          child: ListView.builder(
              itemCount: dummyCoupons.length,
              itemBuilder: (_, index) {
                Coupon coupon = dummyCoupons[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 24, right: 24),
                  child: SizedBox(
                    height: 300,
                    child: ClipPath(
                      clipper: MyClipper(),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: DecoratedBox(
                                    decoration: BoxDecoration(),
                                    child: Center(
                                        child: Text(
                                      '${(coupon.discount * 100).toStringAsFixed(0)}% OFF\t (${coupon.order.items.length} items)',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        letterSpacing: 1.5,
                                      ),
                                    ))),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 25),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 100,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    coupon.order.items.length,
                                                itemBuilder: (_, ind) {
                                                  final ProductModel product =
                                                      coupon.order.items[ind]
                                                          .product;
                                                  return (ind <
                                                          coupon.order.items
                                                                  .length -
                                                              1
                                                      ? Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                CachedNetworkImage(
                                                                    height: 50,
                                                                    imageUrl:
                                                                        product
                                                                            .imgUrl),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  product.name,
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  '\$${product.price.toStringAsFixed(2)}',
                                                                ),
                                                              ],
                                                            ),
                                                            Icon(Icons.add)
                                                          ],
                                                        )
                                                      : Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CachedNetworkImage(
                                                                height: 50,
                                                                imageUrl: product
                                                                    .imgUrl),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              product.name,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              '\$${product.price.toStringAsFixed(2)}',
                                                            ),
                                                          ],
                                                        ));
                                                },
                                              ),
                                            ),
                                            Spacer(),
                                            Row(
                                              children: [
                                                Text(
                                                  "\$${coupon.priceBeforeDisc}",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationColor:
                                                          Colors.red,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(Icons
                                                    .arrow_circle_right_outlined),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "\$${coupon.priceAfterDisc}",
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) =>
                                                                CupertinoAlertDialog(
                                                                    title: Text(
                                                                        "are you sure ?"),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          "cancel",
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color:
                                                                                Theme.of(context).primaryColor.withRed(180),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                            orderList.add(new Order(
                                                                                items: coupon.order.items,
                                                                                totalPrice: coupon.priceAfterDisc));
                                                                          });
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          "yes",
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color:
                                                                                Theme.of(context).primaryColor.withRed(180),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ]));
                                                      });
                                                    },
                                                    child: Text(
                                                      "Check Out",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .primaryColor,
                                                      foregroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .onPrimary,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.1, size.height * 0.5, 0, size.height * 0.7);
    path.lineTo(0, size.height);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.7);
    path.quadraticBezierTo(
        size.width * 0.9, size.height * 0.5, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
