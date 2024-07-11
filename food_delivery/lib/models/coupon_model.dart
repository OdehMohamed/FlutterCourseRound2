import 'package:food_delivery/models/cart_item_model.dart';
import 'package:food_delivery/models/order_model.dart';
import 'package:food_delivery/models/product_model.dart';

class Coupon {
  final Order order;
  final double discount;
  double priceBeforeDisc = 0;
  double priceAfterDisc = 0;

  Coupon(this.order, this.discount) {
    order.items.forEach((e) {
      this.priceBeforeDisc += e.product.price;
    });
    this.priceAfterDisc = double.parse(
        (priceBeforeDisc - (priceBeforeDisc * discount)).toStringAsFixed(2));
  }
}

double totalPrice(List<CartItem> items) {
  double total = 0;
  items.forEach((e) {
    total += e.product.price;
  });
  return total;
}

List<List<CartItem>> dummyCartItems = [
  [
    CartItem(product: dummyProducts[0], quantity: 1),
    CartItem(product: dummyProducts[6], quantity: 1),
    CartItem(product: dummyProducts[8], quantity: 1),
  ],
  [
    CartItem(product: dummyProducts[3], quantity: 1),
    CartItem(product: dummyProducts[4], quantity: 1),
    CartItem(product: dummyProducts[5], quantity: 1),
    CartItem(product: dummyProducts[6], quantity: 1),
  ],
  [
    CartItem(product: dummyProducts[4], quantity: 1),
    CartItem(product: dummyProducts[5], quantity: 1),
    CartItem(product: dummyProducts[7], quantity: 1),
    CartItem(product: dummyProducts[8], quantity: 1),
  ],
  [
    CartItem(product: dummyProducts[2], quantity: 1),
    CartItem(product: dummyProducts[4], quantity: 1),
    CartItem(product: dummyProducts[6], quantity: 1),
    CartItem(product: dummyProducts[7], quantity: 1),
  ],
  [
    CartItem(product: dummyProducts[0], quantity: 1),
    CartItem(product: dummyProducts[1], quantity: 1),
    CartItem(product: dummyProducts[2], quantity: 1),
  ],
];

List<Order> dummyOrder = [
  Order(
    items: dummyCartItems[0],
    totalPrice: CartItem.getCartItemsPrice(dummyCartItems[0]),
  ),
  Order(
    items: dummyCartItems[1],
    totalPrice: CartItem.getCartItemsPrice(dummyCartItems[1]),
  ),
  Order(
    items: dummyCartItems[2],
    totalPrice: CartItem.getCartItemsPrice(dummyCartItems[2]),
  ),
  Order(
    items: dummyCartItems[3],
    totalPrice: CartItem.getCartItemsPrice(dummyCartItems[3]),
  ),
  Order(
    items: dummyCartItems[4],
    totalPrice: CartItem.getCartItemsPrice(dummyCartItems[4]),
  ),
];

List<Coupon> dummyCoupons = [
  Coupon(dummyOrder[0], 0.2),
  Coupon(dummyOrder[1], 0.15),
  Coupon(dummyOrder[2], 0.35),
  Coupon(dummyOrder[3], 0.25),
  Coupon(dummyOrder[4], 0.40),
];
