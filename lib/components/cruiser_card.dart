import 'package:briz/constants.dart';
import 'package:briz/custom_decorations.dart';
import 'package:briz/models/cruiser.dart';
import 'package:briz/screens/cruiser_screen.dart';
import 'package:flutter/material.dart';

class CruiserListItem extends StatelessWidget {
  const CruiserListItem({
    Key? key,
    required this.cruiser,
  }) : super(key: key);

  final Cruiser cruiser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        child: Container(
          width: double.infinity,
          height: 250.0,
          alignment: Alignment.bottomLeft,
          decoration: CardBoxDecoration(imagePath: cruiser.defaultImage),
          child: Container(
            width: double.infinity,
            height: 50.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    cruiser.title,
                    style: kListCardTextStyle,
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'sss',
                      style: kListCardSubtextStyle,
                    ),
                  ))
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
              border: Border.all(color: Colors.black12, width: 0.5),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(
            CruiserScreen.routeId,
            arguments: CruiserScreenArguments(cruiser: cruiser),
          );
        },
      ),
    );
  }
}
