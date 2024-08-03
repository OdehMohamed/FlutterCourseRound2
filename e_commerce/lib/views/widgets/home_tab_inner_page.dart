import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/cart_item_model.dart';
import 'package:e_commerce/models/product_item_model.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/views/widgets/home_carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeTabInnerPage extends StatefulWidget {
  const HomeTabInnerPage({super.key});

  @override
  State<HomeTabInnerPage> createState() => _HomeTabInnerPageState();
}

class _HomeTabInnerPageState extends State<HomeTabInnerPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: size.height * 0.3,
            child: const HomeCarouselSlider(),
          ),
          const SizedBox(height: 16.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'New Arrivals',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Icon(
                          Icons.fireplace_outlined,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('See All'),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                GridView.builder(
                  itemCount: dummyProducts.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final product = dummyProducts[index];
                    return InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    height: 130,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: AppColors.grey2,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CachedNetworkImage(
                                        imageUrl: product.imgUrl,
                                        fit: BoxFit.contain,
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator
                                              .adaptive(),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8.0,
                                    right: 8.0,
                                    child: DecoratedBox(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white54,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            product.toggleFavorite();
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(
                                            product.favorite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            size: 20,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: DecoratedBox(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white54,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            dummyCartProducts.add(CartItemModel(
                                              product: product,
                                              quantity: 1,
                                            ));
                                            final snk = SnackBar(
                                                showCloseIcon: true,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                        .withAlpha(200),
                                                content: Text(
                                                  "Product added to the cart successfully",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                ));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snk);
                                            CartItemModel.totalPrice +=
                                                product.price;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.add,
                                            size: 20,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              product.category,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                            Text(
                              '\$${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ));
                  },
                ),
                const SizedBox(height: 16.0),
              ])),
        ],
      ),
    );
  }
}
