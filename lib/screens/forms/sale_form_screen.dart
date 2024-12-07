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
  final _dateController = TextEditingController();
  final _valueController = TextEditingController();
  final _productController = TextEditingController();

  void _saveSale() {
    if (_formKey.currentState!.validate()) {
      // Simulação de uma lista de produtos
      final products = [
        Product(name: _productController.text, price: 0, quantity: 0),
      ];

      final sale = Sale(
        date: DateTime.parse(_dateController.text),
        value: double.parse(_valueController.text),
        products: products,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Venda salva no valor de R\$${sale.value}')),
      );
      Navigator.of(context).pop(sale); // Retorna o objeto salvo
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Venda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: 'Data (yyyy-MM-dd)'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'A data é obrigatória.';
                  }
                  try {
                    DateTime.parse(value);
                  } catch (_) {
                    return 'Formato inválido.';
                  }
                  return null;
                },
              ),
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
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveSale,
                child: const Text('Salvar Venda'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    _valueController.dispose();
    _productController.dispose();
    super.dispose();
  }
}