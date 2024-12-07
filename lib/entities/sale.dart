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

  const SaleCard({super.key, required this.sale});

  @override
  State<SaleCard> createState() => _SaleCardState();
}

class _SaleCardState extends State<SaleCard> {
  void onDelete() {
    setState(() {});
  }

  void onEdit() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('HH:mm');
    final productNames = widget.sale.products.map((p) => p.name).join(", ");

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${dateFormat.format(widget.sale.date)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 300,
                  child: Text(
                    "Produtos: $productNames",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "R\$ ${widget.sale.value.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(
                    Icons.edit,
                    size: 30,
                  ),
                  color: Colors.blue,
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete,
                    size: 30,
                  ),
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
