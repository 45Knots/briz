import 'package:flutter/material.dart';

class MyListHeader extends StatelessWidget {
  const MyListHeader({
    Key? key,
    required this.title,
    this.alignment = TextAlign.left,
  }) : super(key: key);

  final String title;
  final TextAlign alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 12.0, bottom: 4.0),
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor, boxShadow: [
        BoxShadow(
          blurRadius: 10,
          spreadRadius: 10,
          blurStyle: BlurStyle.normal,
          color: Theme.of(context).backgroundColor,
        )
      ]
          //Theme.of(context).canvasColor),
          ),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.black87),
            textAlign: alignment,
          ),
        ],
      ),
    );
  }
}
