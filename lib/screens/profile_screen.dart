import 'package:briz/components/dummy_sliver_list.dart';
import 'package:briz/components/my_info_bar.dart';
import 'package:briz/components/flupp/flupp_scaffold.dart';
import 'package:briz/components/flupp/flupp_sliverappbar.dart';
import 'package:briz/services/userprofile_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeId = "profile_screen";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    UserProfileService userProfileService = Provider.of<UserProfileService>(context, listen: false);

    return FluppScaffold(
      screenIndex: 1,
      settings: const FluppScaffoldSettings(
        appBarSettings: FluppSliverAppBarSettings(
          title: FluppSliverAppBarTitleSettings(text: ""),
          pinned: true,
          expandedHeight: 100,
        ),
      ),
      slivers: [
        SliverStickyHeader(
          sticky: false,
          overlapsContent: false,
          header: MyInfoBar(avatarImageUrl: userProfileService.currentUser!.photoURL!),
          sliver: const DummySliverList(),
        ),
      ],
    );
  }
}
