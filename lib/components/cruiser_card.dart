import 'package:briz/custom_decorations.dart';
import 'package:briz/models/cruiser.dart';
import 'package:briz/screens/cruiser_screen.dart';
import 'package:flutter/material.dart';
import 'generic/card_info_bar.dart';

class CruiserListItem extends StatelessWidget {
  const CruiserListItem({
    Key? key,
    required this.cruiser,
  }) : super(key: key);

  final Cruiser cruiser;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).backgroundColor.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          child: Container(
            width: double.infinity,
            height: 200.0,
            alignment: Alignment.bottomLeft,
            decoration: CardBoxDecoration(
              imagePath: cruiser.defaultImage,
              borderWidth: 2,
              borderColor: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            child: CardInfoBar(title: cruiser.title),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              CruiserScreen.routeId,
              arguments: CruiserScreenArguments(cruiser: cruiser),
            );
          },
        ),
      ),
    );
  }
}
