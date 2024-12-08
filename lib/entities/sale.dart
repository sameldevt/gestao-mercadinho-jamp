import 'package:flutter/material.dart';
import 'package:mercadinho_jamp/entities/product.dart';
import 'package:intl/intl.dart';

class Sale {
  final List<Product> products;
  final DateTime date;
  final double value;

  const Sale({required this.date, required this.value, required this.products});
}

class SaleCard extends StatefulWidget {
  final Sale sale;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const SaleCard(
      {super.key,
      required this.sale,
      required this.onDelete,
      required this.onEdit});

  @override
  State<SaleCard> createState() => _SaleCardState();
}

class _SaleCardState extends State<SaleCard> {
  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('HH:mm');
    final productNames = widget.sale.products.map((p) => p.name).join("\n");

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.maxFinite,
            height: 38, // Altura da faixa
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12), // Borda arredondada apenas no topo
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${dateFormat.format(widget.sale.date)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "R\$ ${widget.sale.value.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 300,
                  child: Text(
                    "$productNames",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: widget.onEdit,
                      icon: const Icon(
                        Icons.edit,
                        size: 30,
                      ),
                      color: Colors.black,
                    ),
                    IconButton(
                      onPressed: widget.onDelete,
                      icon: const Icon(
                        Icons.delete,
                        size: 30,
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),

          ),

        ],
      ),
    );
  }
}
