import 'package:flutter/material.dart';
import 'package:mercadinho_jamp/screens/widgets/generic_card.dart';

class ListScreen extends StatefulWidget {
  final String title;
  final List<Widget> cards;
  final Widget noItemScreen;

  const ListScreen({
    Key? key,
    required this.title,
    required this.cards,
    required this.noItemScreen,
  }) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Future<void> _refreshList() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshList,
              child: widget.cards.isEmpty
                  ? widget.noItemScreen
                  : ListView.builder(
                      itemCount: widget.cards.length,
                      itemBuilder: (context, index) {
                        return widget.cards[index];
                      },
                    ),
            ),
          ),
        ],
      );
  }
}
