import 'package:flutter/material.dart';

class Debtor {
  final String name;
  final String phone;
  final double totalDebt;

  const Debtor({required this.name, required this.phone, required this.totalDebt});
}

class DebtorCard extends StatefulWidget {
  final Debtor debtor;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const DebtorCard({super.key, required this.debtor, required this.onDelete, required this.onEdit});

  @override
  State<DebtorCard> createState() => _DebtorCardState();
}

class _DebtorCardState extends State<DebtorCard> {

  void onDelete(){
    setState(() {

    });
  }

  void onEdit(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
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
                  "${widget.debtor.name}",
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
                    "${widget.debtor.phone}",
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
                  "R\$ ${widget.debtor.totalDebt.toStringAsFixed(2)}",
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
                  onPressed: widget.onEdit,
                  icon: const Icon(
                    Icons.edit,
                    size: 30,
                  ),
                  color: Colors.blue,
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
            )
          ],
        ),
      ),
    );
  }
}
