import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/models/cart_item_model.dart';
import 'package:food_delivery/models/order_model.dart';

class OrdersPage extends StatefulWidget {
  static final String routeName = "/orders_page";
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: orderList.length,
                itemBuilder: (_, index) {
                  Order order = orderList[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          order.isVisible = !order.isVisible;
                        });
                      },
                      child: Card(
                        color: Theme.of(context).colorScheme.onPrimary,
                        elevation: 10,
                        child: Column(
                          children: [
                            ListTile(
                              title: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Order ${index + 1}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Total price :",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        Text(
                                          ' \$${order.totalPrice}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Theme.of(context).primaryColor,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Icon(
                              !order.isVisible
                                  ? Icons.keyboard_double_arrow_up
                                  : Icons.keyboard_double_arrow_down,
                            ),
                            Visibility(
                                visible: order.isVisible,
                                maintainAnimation: true,
                                maintainState: true,
                                child: AnimatedOpacity(
                                    duration: const Duration(seconds: 3),
                                    curve: Curves.fastOutSlowIn,
                                    opacity: order.isVisible ? 1 : 0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 18.0, right: 18),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("image"),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Text("name"),
                                              SizedBox(
                                                width: 40,
                                              ),
                                              Text("price"),
                                              Text("quantity"),
                                              Text("total"),
                                            ],
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: order.items.length * 80,
                                            child: ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: order.items.length,
                                                itemBuilder: (_, index) {
                                                  CartItem orderItem =
                                                      order.items[index];
                                                  return Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          CachedNetworkImage(
                                                            imageUrl: orderItem
                                                                .product.imgUrl,
                                                            width: 60,
                                                          ),
                                                          Text(orderItem
                                                              .product.name),
                                                          Text(
                                                              '\$${orderItem.product.price}'),
                                                          Text(orderItem
                                                              .quantity
                                                              .toString()),
                                                          Text(
                                                              '\$${orderItem.totalPrice()}'),
                                                        ],
                                                      ),
                                                      Divider(),
                                                    ],
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
