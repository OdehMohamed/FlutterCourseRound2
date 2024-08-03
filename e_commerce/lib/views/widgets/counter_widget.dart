import 'package:e_commerce/models/cart_item_model.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  int counter;
  final CartItemModel cartItem;

  CounterWidget({super.key, required this.cartItem, required this.counter});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          height: 35,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: AppColors.grey2,
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    color: Colors.red,
                    icon: const Icon(Icons.remove),
                    onPressed: (widget.cartItem.quantity > 1)
                        ? () {
                            setState(() {
                              widget.cartItem.quantity--;
                              CartItemModel.totalPrice -=
                                  widget.cartItem.product.price;
                            });
                          }
                        : null,
                  ),
                ),
                Text(
                  '${widget.cartItem.quantity}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                      padding: const EdgeInsets.all(0),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.onPrimary,
                      )),
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          widget.cartItem.quantity++;
                          CartItemModel.totalPrice +=
                              widget.cartItem.product.price;
                        });
                      }),
                ),
              ],
            ),
          ),
        ),
        Text(
          '\$${widget.cartItem.product.price * widget.cartItem.quantity}',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
