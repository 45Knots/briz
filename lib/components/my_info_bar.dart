import 'package:briz/components/my_avatar.dart';
import 'package:flutter/material.dart';

class MyInfoBar extends StatelessWidget {
  const MyInfoBar({Key? key, this.avatarImageUrl = ""}) : super(key: key);

  final String avatarImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            child: MyAvatar(
              imageUrl: avatarImageUrl,
            ),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
