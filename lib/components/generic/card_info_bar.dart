import 'package:flutter/material.dart';
import '../../constants.dart';

class CardInfoBar extends StatelessWidget {
  const CardInfoBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(3.0), bottomRight: Radius.circular(3.0)),
        border: Border.all(color: Colors.black12, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Text(
              title,
              style: kListCardTextStyle.copyWith(color: Colors.white),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              child: const Text(
                '',
                style: kListCardSubtextStyle,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
