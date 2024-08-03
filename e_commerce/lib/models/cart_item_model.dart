import 'package:e_commerce/models/product_item_model.dart';

class CartItemModel {
  final ProductItemModel product;
  int quantity;
  static double totalPrice = 0;
  CartItemModel({
    required this.product,
    required this.quantity,
  });
}

List<CartItemModel> dummyCartProducts = [];
