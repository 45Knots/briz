import 'package:briz/constants.dart';
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
      padding: const EdgeInsets.only(top: 20.0, left: 10.0, bottom: 10.0),
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: Text(
        title,
        style: kListTitleTextStyle,
        textAlign: alignment,
      ),
    );
  }
}
