import 'package:food_delivery/models/cart_item_model.dart';

class Order {
  final List<CartItem> items;
  final double totalPrice;
  bool isVisible = false;
  Order({required this.items, required this.totalPrice});
}

List<Order> orderList = [];
