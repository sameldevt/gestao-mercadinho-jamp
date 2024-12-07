import 'package:flutter/material.dart';

class GenericCard<T> extends StatelessWidget {
  final T item;
  final Widget Function(T) builder;

  const GenericCard({super.key, required this.item, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: builder(item),
      ),
    );
  }
}
