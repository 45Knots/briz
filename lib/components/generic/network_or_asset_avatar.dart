import 'package:briz/components/generic/network_or_asset_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class NetworkOrAssetAvatar extends StatelessWidget {
  const NetworkOrAssetAvatar({
    Key? key,
    this.imagePathOrUrl,
    this.radius = 30.0,
    this.borderWidth = 2,
  }) : super(key: key);

  final String? imagePathOrUrl;
  final double radius;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return CircularProfileAvatar(
      '',
      radius: radius,
      borderColor: Colors.white,
      borderWidth: borderWidth,
      child: NetworkOrAssetImage(
        imagePathOrUrl: imagePathOrUrl,
        fit: BoxFit.cover,
        fallBackIcon: Icons.account_circle,
      ),
    );
  }
}
