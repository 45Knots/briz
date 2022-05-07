import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CardBoxDecoration extends BoxDecoration {
  final String imagePath;
  final double borderWidth;
  final Color borderColor;

  CardBoxDecoration({
    this.imagePath = "assets/images/camera.png",
    this.borderWidth = 1,
    this.borderColor = Colors.white54,
  }) : super(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: imagePath.startsWith('assets/')
                  ? ExtendedAssetImageProvider(
                      imagePath,
                    ) as ImageProvider
                  : ExtendedNetworkImageProvider(
                      imagePath,
                      cache: true,
                    ),
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
