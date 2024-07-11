import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item_model.dart';
import 'package:food_delivery/models/order_model.dart';

class CartPage extends StatefulWidget {
  static String routeName = "/cart_page";
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPriceOFAllOrders() {
    double total = 0;
    cartItemsList.forEach((element) {
      total += element.product.price * element.quantity;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: cartItemsList.length,
                itemBuilder: (_, index) => Padding(
                      padding:
                          const EdgeInsets.only(top: 24.0, right: 24, left: 24),
                      child: SizedBox(
                        height: 180,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 16),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: cartItemsList[index]
                                                  .product
                                                  .imgUrl,
                                              width: 100,
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Text(
                                              cartItemsList[index].product.name,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text("Price"),
                                              Text(
                                                "\$${cartItemsList[index].product.price}",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: VerticalDivider(
                                              color: Theme.of(context)
                                                  .dividerColor,
                                            ),
                                          ),
                                          Column(children: [
                                            Text("Quantity"),
                                            Text(
                                              "${cartItemsList[index].quantity}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ]),
                                          SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: VerticalDivider(
                                              color: Theme.of(context)
                                                  .dividerColor,
                                            ),
                                          ),
                                          Column(children: [
                                            Text("Total price"),
                                            Text(
                                                "\$${cartItemsList[index].product.price * cartItemsList[index].quantity}",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ))
                                          ])
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Theme.of(context).primaryColor),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              CupertinoAlertDialog(
                                                  title: Text("are you sure ?"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        "cancel",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor
                                                                  .withRed(180),
                                                        ),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          cartItemsList
                                                              .removeAt(index);
                                                          Navigator.of(context)
                                                              .pop();
                                                        });
                                                      },
                                                      child: Text(
                                                        "yes",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor
                                                                  .withRed(180),
                                                        ),
                                                      ),
                                                    ),
                                                  ]));
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.delete,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                "Total Price: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                '\$${totalPriceOFAllOrders().toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showDialog(
                                  context: context,
                                  builder: (context) => CupertinoAlertDialog(
                                          title: Text("are you sure ?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                "cancel",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withRed(180),
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  List<CartItem> tempList =
                                                      cartItemsList.toList();
                                                  Navigator.of(context).pop();
                                                  orderList.add(new Order(
                                                      items: tempList,
                                                      totalPrice: CartItem
                                                          .getCartItemsPrice(
                                                              tempList)));
                                                  cartItemsList.clear();
                                                });
                                              },
                                              child: Text(
                                                "yes",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withRed(180),
                                                ),
                                              ),
                                            ),
                                          ]));
                            });
                          },
                          child: Text(
                            "Check Out",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
