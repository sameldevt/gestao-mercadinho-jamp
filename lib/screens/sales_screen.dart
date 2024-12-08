import 'package:flutter/material.dart';
import 'package:mercadinho_jamp/entities/sale.dart';
import 'package:mercadinho_jamp/screens/forms/sale_form_screen.dart';
import 'package:mercadinho_jamp/screens/list_screen.dart';

import '../entities/product.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  void onDelete() {
    setState(() {});
  }

  void onEdit() {
    setState(() {});
  }

  void _addSale() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SaleFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addSale,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: ListScreen(
        title: "Vendas",
        noItemScreen: const Center(
          child: Text(
            "Nenhum item cadastrado",
          ),
        ),
        cards: [
          Sale(
            date: DateTime.now(),
            value: 10.2,
            products: [
              Product(name: "pão", price: 0.3, quantity: 10),
              Product(name: "coca cola", price: 8.3, quantity: 10),
            ],
          ),
          Sale(
            date: DateTime.now(),
            value: 10.2,
            products: [
              Product(name: "pão", price: 0.3, quantity: 10),
              Product(name: "coca cola", price: 8.3, quantity: 10),
            ],
          ),
          Sale(
            date: DateTime.now(),
            value: 10.2,
            products: [
              Product(name: "pão", price: 0.3, quantity: 10),
              Product(name: "coca cola", price: 8.3, quantity: 10),
            ],
          ),
          Sale(
            date: DateTime.now(),
            value: 10.2,
            products: [
              Product(name: "pão", price: 0.3, quantity: 10),
              Product(name: "coca cola", price: 8.3, quantity: 10),
            ],
          ),
        ]
            .map(
              (sale) => SaleCard(
                sale: sale,
                onDelete: onDelete,
                onEdit: onEdit,
              ),
            )
            .toList(),
      ),
    );
  }
}
