import 'package:flutter/material.dart';
import 'package:mercadinho_jamp/entities/debtor.dart';
import 'package:mercadinho_jamp/screens/list_screen.dart';

class DebtorsScreen extends StatefulWidget {
  const DebtorsScreen({super.key});

  @override
  State<DebtorsScreen> createState() => _DebtorsScreenState();
}

class _DebtorsScreenState extends State<DebtorsScreen> {
  void onDelete(){
    setState(() {

    });
  }

  void onEdit(){
    setState(() {

    });
  }

  void _addDebtor() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addDebtor,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: ListScreen(
        title: "Devedores",
        noItemScreen: const Center(
          child: Text(
            "Nenhum item cadastrado",
          ),
        ),
        cards: [
          Debtor(name: "teste", phone: "(11)92331233", totalDebt: 100),
          Debtor(name: "teste", phone: "(11)92331233", totalDebt: 100),
          Debtor(name: "teste", phone: "(11)92331233", totalDebt: 100)
        ].map((debtor) => DebtorCard(debtor: debtor, onDelete: onDelete, onEdit: onEdit)).toList(),
      ),
    );
  }
}
