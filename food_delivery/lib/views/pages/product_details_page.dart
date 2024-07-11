import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item_model.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/views/pages/cart_page.dart';
import 'package:food_delivery/views/widgets/property_item.dart';

class ProductDetailsPage extends StatefulWidget {
  static const String routeName = '/product_details';

  const ProductDetailsPage({super.key});
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int counter = 1;
  // late double totalPrice;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        // backgroundColor: AppColors.grey2,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text("Product Details"),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartPage.routeName);
                },
              ),
              Positioned(
                right: 0,
                top: 3,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).primaryColor,
                          spreadRadius: 0.1,
                          blurRadius: 7,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        '${cartItemsList.length}',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    )),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              product.isFavorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              setState(() {
                product.isFavorite = !product.isFavorite;
              });
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 400,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          // color: AppColors.grey2,
                          color: Theme.of(context).colorScheme.background,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 90.0),
                          child: CachedNetworkImage(
                            imageUrl: product.imgUrl,
                          ),
                        ),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.grey100,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: SizedBox(
                                  height: 6,
                                  width: 80,
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                    color: AppColors.grey2,
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26,
                                        ),
                                      ),
                                      Text(
                                        product.category.name,
                                        style: const TextStyle(
                                            color: AppColors.grey),
                                      ),
                                    ],
                                  ),
                                  // CounterWidget(),
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
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
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  PropertyItem(
                                    title: 'Size',
                                    value: 'Medium',
                                  ),
                                  SizedBox(
                                    height: 25,
                                    child: VerticalDivider(
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  PropertyItem(
                                    title: 'Calories',
                                    value: '150 Kcal',
                                  ),
                                  SizedBox(
                                    height: 25,
                                    child: VerticalDivider(
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  PropertyItem(
                                    title: 'Cooking',
                                    value: '5- 10 Min',
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(product.description),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 80,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '\$${(product.price * counter).toStringAsFixed(2)}',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: ElevatedButton(
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
                                                  cartItemsList.add(
                                                      new CartItem(
                                                          product: product,
                                                          quantity: counter));
                                                  Navigator.of(context).pop();
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
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Send to cart",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
