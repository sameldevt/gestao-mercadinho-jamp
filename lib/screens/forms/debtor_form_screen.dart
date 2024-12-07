import 'package:flutter/material.dart';
import 'package:mercadinho_jamp/entities/debtor.dart';

class DebtorFormScreen extends StatefulWidget {
  const DebtorFormScreen({super.key});

  @override
  State<DebtorFormScreen> createState() => _DebtorFormScreenState();
}

class _DebtorFormScreenState extends State<DebtorFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _totalDebtController = TextEditingController();

  void _saveDebtor() {
    if (_formKey.currentState!.validate()) {
      final debtor = Debtor(
        name: _nameController.text,
        phone: _phoneController.text,
        totalDebt: double.parse(_totalDebtController.text),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Devedor salvo: ${debtor.name}')),
      );
      Navigator.of(context).pop(debtor); // Retorna o objeto salvo
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Devedor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O nome é obrigatório.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Telefone'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O telefone é obrigatório.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _totalDebtController,
                decoration: const InputDecoration(labelText: 'Dívida Total'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'A dívida total é obrigatória.';
                  }
                  final parsed = double.tryParse(value);
                  if (parsed == null || parsed < 0) {
                    return 'Insira um valor válido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveDebtor,
                child: const Text('Salvar Devedor'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _totalDebtController.dispose();
    super.dispose();
  }
}