import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class MyAvatar extends StatefulWidget {
  const MyAvatar({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  State<MyAvatar> createState() => _MyAvatarState();
}

class _MyAvatarState extends State<MyAvatar> {
  @override
  Widget build(BuildContext context) {
    Widget _avatar = widget.imageUrl.startsWith('assets/')
        ? CircularProfileAvatar(
            '',
            child: Image.asset(widget.imageUrl, fit: BoxFit.cover),
            radius: 30.0,
            borderColor: Theme.of(context).colorScheme.outline,
            borderWidth: 2,
          )
        : CircularProfileAvatar(
            widget.imageUrl,
            radius: 30.0,
            borderColor: Theme.of(context).colorScheme.outline,
            borderWidth: 2,
            imageFit: BoxFit.cover,
          );

    return _avatar;
  }
}
