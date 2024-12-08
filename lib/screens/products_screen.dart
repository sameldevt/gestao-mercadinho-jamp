import 'package:flutter/material.dart';
import 'package:mercadinho_jamp/entities/product.dart';
import 'package:mercadinho_jamp/screens/list_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void onDelete(){
    setState(() {

    });
  }

  void onEdit(){
    setState(() {

    });
  }

  void _addProduct() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: ListScreen(
        title: "Produtos",
        noItemScreen: const Center(
          child: Text(
            "Nenhum item cadastrado",
          ),
        ),
        cards: [
          Product(name: "pão", price: 0.3, quantity: 10),
          Product(name: "coca cola", price: 8.3, quantity: 10),
        ].map((product) => ProductCard(product: product, onDelete: onDelete, onEdit: onEdit,)).toList(),
      ),
    );
  }
}
