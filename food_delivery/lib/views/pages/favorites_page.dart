import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/app_colors.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late List<ProductModel> favoriteProducts;
  @override
  void initState() {
    super.initState();
    favoriteProducts =
        dummyProducts.where((element) => element.isFavorite == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 16,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "Favorite Products",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: favoriteProducts.length,
                itemBuilder: (_, index) {
                  final product = favoriteProducts[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 4,
                            right: 4,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    product.isFavorite = false;
                                    favoriteProducts.removeAt(index);
                                  });
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: AppColors.red,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 12.0,
                              left: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  product.imgUrl,
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Column(
                                    children: [
                                      Text(
                                        product.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "\$${product.price}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primary,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
