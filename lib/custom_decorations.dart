import 'package:briz/components/generic/network_or_asset_image.dart';
import 'package:flutter/material.dart';

class CardBoxDecoration extends BoxDecoration {
  final String imagePath;
  final double borderWidth;
  final Color borderColor;

  CardBoxDecoration({this.imagePath = "assets/images/camera.png", this.borderWidth = 1, this.borderColor = Colors.white})
      : super(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkOrAssetImage.provider(imagePath),
            ),
            border: Border.all(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(5));
}

class SelectedCardBoxDecoration extends CardBoxDecoration {
  SelectedCardBoxDecoration({
    imagePath = "assets/images/camera.png",
    borderWidth = 3,
    borderColor = Colors.orange,
  }) : super(imagePath: imagePath, borderWidth: borderWidth, borderColor: borderColor);
}
