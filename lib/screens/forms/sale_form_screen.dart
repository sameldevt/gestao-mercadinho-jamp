import 'package:flutter/material.dart';

import '../../entities/product.dart';
import '../../entities/sale.dart';

class SaleFormScreen extends StatefulWidget {
  const SaleFormScreen({super.key});

  @override
  State<SaleFormScreen> createState() => _SaleFormScreenState();
}

class _SaleFormScreenState extends State<SaleFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _valueController = TextEditingController();
  final _productController = TextEditingController();

  void _saveSale() {
    if (_formKey.currentState!.validate()) {
      final products = [
        Product(name: _productController.text, price: 0, quantity: 0),
      ];

      final sale = Sale(
        date: DateTime.now(),
        value: double.parse(_valueController.text),
        products: products,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Venda salva no valor de R\$${sale.value}')),
      );
      Navigator.of(context).pop(sale);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Salvar venda",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _valueController,
                      decoration: const InputDecoration(labelText: 'Valor Total'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O valor é obrigatório.';
                        }
                        final parsed = double.tryParse(value);
                        if (parsed == null || parsed < 0) {
                          return 'Insira um valor válido.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _productController,
                      decoration: const InputDecoration(labelText: 'Produtos'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira pelo menos um produto.';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _saveSale,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Fundo vermelho
                foregroundColor: Colors.white, // Texto branco
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Borda arredondada
                ),
              ),
              child: const Text("Salvar venda", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _valueController.dispose();
    _productController.dispose();
    super.dispose();
  }
}