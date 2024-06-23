import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/item_model.dart';
import '../models/piso_model.dart';

class CartItemControl extends StatelessWidget {
  final Piso piso;

  const CartItemControl(this.piso, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (context, cart, child) {
      final cartItem = cart.items.firstWhere(
        (item) => item.item.name == piso.name,
        orElse: () => Item(item: piso, quantity: 0),
      );

      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              color: cartItem.quantity > 0 ? Colors.black : Colors.grey,
            ),
            onPressed:
                cartItem.quantity > 0 ? () => cart.removeItem(cartItem) : null,
          ),
          Text(
            '${cartItem.quantity}',
            style: const TextStyle(fontSize: 18),
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () => cart.addItem(piso),
          )
        ],
      );
    });
  }
}
