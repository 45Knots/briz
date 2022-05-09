import 'package:briz/components/my_list_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class MySliverWithHeader extends StatelessWidget {
  const MySliverWithHeader({
    Key? key,
    required this.title,
    required this.sliver,
    this.sticky = false,
  }) : super(key: key);
  final String title;
  final Widget sliver;
  final bool sticky;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      overlapsContent: false,
      header: MyListHeader(
        title: title,
      ),
      sticky: sticky,
      sliver: sliver,
    );
  }
}
