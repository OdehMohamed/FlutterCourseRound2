import 'package:flutter/material.dart';
import 'package:food_delivery/models/category_model.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategoryId;
  late List<ProductModel> filteredProducts;
  //late Map<String, bool> favoriteProducts;
  @override
  void initState() {
    super.initState();
    filteredProducts = dummyProducts;
  }

  void search(String str) {
    setState(() {
      if (str.isEmpty) {
        filteredProducts = dummyProducts;
      } else {
        filteredProducts = dummyProducts.where((element) {
          return element.name.toLowerCase().contains(str.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
        left: 16,
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 16,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/food_banner.jpg',
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 50,
            child: TextField(
              onChanged: (value) => search(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find your food',
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: dummyCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = dummyCategories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (selectedCategoryId == category.id) {
                          selectedCategoryId = null;
                          filteredProducts = dummyProducts;
                        } else {
                          selectedCategoryId = category.id;
                          filteredProducts = dummyProducts
                              .where((element) =>
                                  element.category.id == selectedCategoryId)
                              .toList();
                        }
                      });
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: selectedCategoryId == category.id
                            ? AppColors.primary
                            : AppColors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Image.asset(
                              category.imgUrl,
                              width: 50,
                              height: 50,
                              color: selectedCategoryId == category.id
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              category.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: selectedCategoryId == category.id
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 16,
            ),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final product = filteredProducts[index];
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            product.imgUrl,
                            height: 100,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
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
                    Positioned(
                      top: 8,
                      right: 8,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grey100,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              product.isFavorite = !product.isFavorite;
                            });
                          },
                          child: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: AppColors.primary,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 24,
          ),
        ]),
      ),
    );
  }
}
