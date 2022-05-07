import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  const MyAvatar({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircularProfileAvatar(
      imageUrl,
      radius: 30.0,
      borderColor: Theme.of(context).colorScheme.outline,
      borderWidth: 5,
      imageFit: BoxFit.cover,
    );
  }
}
