import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kadu_pisos/models/cart_model.dart';
import '../components/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Carrinho'),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset(cart.items[index].item.image),
                title: Text(cart.items[index].item.name),
                subtitle: Text('Quantidade: ${cart.items[index].quantity}'),
                trailing: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    cart.removeItem(cart.items[index]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
