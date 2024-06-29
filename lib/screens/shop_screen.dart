import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kadu_pisos/screens/product_details_screen.dart';
import '../repositories/piso_repository.dart';
import '../components/custom_app_bar.dart';
import '../screens/cart_screen.dart';
import '../components/cart_item_control.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Compras'),
      body: ListView.builder(
        itemCount: pisos.length,
        itemBuilder: (context, index) {
          final piso = pisos[index];
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    child: Image.asset(piso.image, width: 50, height: 50),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(piso: piso),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsScreen(piso: piso),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            piso.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFF2C026),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(piso.description),
                        ],
                      ),
                    ),
                  ),
                  CartItemControl(piso),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(),
            ),
          );
        },
        backgroundColor: const Color(0XFF635655),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: Color(0xFFF2C026),
        ),
      ),
    );
  }
}
