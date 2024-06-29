import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kadu_pisos/models/cart_model.dart';
import '../components/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Carrinho'),
      body: Column(
        children: [
          Expanded(
            child: Consumer<CartModel>(
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                // Add your logic here
              },
              child: Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color:  const Color(0XFF635655),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Solicitar orçamento',
                    style: TextStyle(
                      color:Color(0xFFF2C026),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
