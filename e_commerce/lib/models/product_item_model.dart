enum ProductSize {
  S,
  M,
  L,
  XL,
  XXL;

  static ProductSize fromString(String size) {
    if (size == ProductSize.S.name) {
      return ProductSize.S;
    } else if (size == ProductSize.M.name) {
      return ProductSize.M;
    } else if (size == ProductSize.L.name) {
      return ProductSize.L;
    } else if (size == ProductSize.XL.name) {
      return ProductSize.XL;
    } else {
      return ProductSize.XXL;
    }
  }
}

mixin isFavorite {
  bool favorite = false;

  void toggleFavorite() {
    favorite = !favorite;
  }
}

class ProductItemModel with isFavorite {
  final String id;
  final String name;
  final String imgUrl;
  final String description;
  final double price;
  final String category;
  final double averageRate;

  ProductItemModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    this.description =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    required this.price,
    required this.category,
    this.averageRate = 4.5,
  });

  ProductItemModel copyWith({
    String? id,
    String? name,
    String? imgUrl,
    String? description,
    double? price,
    String? category,
    double? averageRate,
    int? quantity,
    ProductSize? size,
  }) {
    return ProductItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      averageRate: averageRate ?? this.averageRate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'imgUrl': imgUrl});
    result.addAll({'description': description});
    result.addAll({'price': price});
    result.addAll({'category': category});
    result.addAll({'averageRate': averageRate});

    return result;
  }

  factory ProductItemModel.fromMap(
      Map<String, dynamic> map, String documentId) {
    return ProductItemModel(
      id: documentId,
      name: map['name'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      category: map['category'] ?? '',
      averageRate: map['averageRate']?.toDouble() ?? 0.0,
    );
  }
}

List<ProductItemModel> dummyFavorites = [];

List<ProductItemModel> dummyProducts = [
  ProductItemModel(
    id: 'TUbtVrVcMNHpZF33cxKC',
    name: 'Black Shoes',
    imgUrl: 'https://pngimg.com/d/men_shoes_PNG7475.png',
    price: 20,
    category: 'Shoes',
  ),
  ProductItemModel(
    id: 'zuHIOlufjUFsacVn48kt',
    name: 'Trousers',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2016/09/Trouser-Free-Download-PNG.png',
    price: 30,
    category: 'Clothes',
  ),
  ProductItemModel(
    id: 's4pMZiAh7i4S8rdavVHT',
    name: 'Sweet Shirt',
    imgUrl:
        'https://www.usherbrand.com/cdn/shop/products/5uYjJeWpde9urtZyWKwFK4GHS6S3thwKRuYaMRph7bBDyqSZwZ_87x1mq24b2e7_1800x1800.png',
    price: 15,
    category: 'Clothes',
  ),
  ProductItemModel(
    id: 'i432lK9i8h9021h6231',
    name: 'Black T-Shirt',
    imgUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/035/198/305/small_2x/ai-generated-black-t-shirt-mockup-front-and-back-view-isolated-on-transparent-background-generated-ai-free-png.png',
    price: 10,
    category: 'Clothes',
  ),
  ProductItemModel(
    id: 'k3y098y876g79654321',
    name: 'Blue Jeans',
    imgUrl: 'https://pngimg.com/d/jeans_PNG5745.png',
    price: 25,
    category: 'Clothes',
  ),
];
