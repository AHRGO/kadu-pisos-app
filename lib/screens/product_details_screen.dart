import 'package:flutter/material.dart';
import 'package:kadu_pisos/models/piso_model.dart';
import '../components/custom_app_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Piso piso;

  ProductDetailsScreen({required this.piso});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Detalhes'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                piso.image,
                height: 250,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              piso.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'R\$${piso.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 20),
            Text(
              piso.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
