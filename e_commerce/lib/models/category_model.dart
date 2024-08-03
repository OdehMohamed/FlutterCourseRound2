class CategoryModel {
  final String id;
  final String name;
  final String imgUrl;
  final int quantity;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.quantity,
  });
}

List<CategoryModel> dummyCategories = [
  CategoryModel(
    id: '1',
    name: 'New Arrivals',
    imgUrl:
        'https://www.usherbrand.com/cdn/shop/products/5uYjJeWpde9urtZyWKwFK4GHS6S3thwKRuYaMRph7bBDyqSZwZ_87x1mq24b2e7_1800x1800.png',
    quantity: 20,
  ),
  CategoryModel(
    id: '2',
    name: 'Clothes',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2016/09/Trouser-Free-Download-PNG.png',
    quantity: 15,
  ),
  CategoryModel(
    id: '4',
    name: 'Shoes',
    imgUrl: 'https://pngimg.com/d/men_shoes_PNG7475.png',
    quantity: 5,
  ),
  CategoryModel(
    id: '3',
    name: 'Bags',
    imgUrl:
        'https://cdn.pixabay.com/photo/2021/12/27/03/54/fashion-6896241_1280.png',
    quantity: 10,
  ),
  CategoryModel(
    id: '5',
    name: 'Electronics',
    imgUrl:
        'https://cdn.pixabay.com/photo/2013/07/13/12/17/headphone-159569_1280.png',
    quantity: 30,
  ),
];
