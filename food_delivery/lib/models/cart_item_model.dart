import 'package:food_delivery/models/product_model.dart';

class CartItem {
  final ProductModel product;
  final int quantity;
  const CartItem({required this.product, required this.quantity});

  double totalPrice() {
    return product.price * quantity;
  }

  static double getCartItemsPrice(List<CartItem> cartItemsList) {
    double totalPrice = 0;
    for (int i = 0; i < cartItemsList.length; i++) {
      totalPrice += cartItemsList[i].product.price * cartItemsList[i].quantity;
    }
    return double.parse(totalPrice.toStringAsFixed(2));
  }
}

List<CartItem> cartItemsList = [];
