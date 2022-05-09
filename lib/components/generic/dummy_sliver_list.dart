import 'package:flutter/material.dart';

class DummySliverList extends StatelessWidget {
  const DummySliverList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: index % 2 == 0 ? Colors.green : Colors.greenAccent,
              height: 80,
              alignment: Alignment.center,
              child: Text(
                "Item $index",
                style: const TextStyle(fontSize: 30),
              ),
            ),
          );
        },
        // 40 list items
        childCount: 40,
      ),
    );
  }
}
