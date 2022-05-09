import 'package:briz/components/generic/dummy_sliver_list.dart';
import 'package:briz/components/flupp/flupp_scaffold.dart';
import 'package:briz/components/flupp/flupp_sliverappbar.dart';
import 'package:briz/constants.dart';
import 'package:briz/services/userprofile_service.dart';
import 'package:flutter/material.dart';
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
      settings: FluppScaffoldSettings(
          appBar: FluppSliverAppBarSettings(
            title: const FluppSliverAppBarTitleSettings(text: ""),
            pinned: true,
            expandedHeight: 100,
            avatar: FluppSliverAppBarAvatarSettings(
              show: true,
              alignment: Alignment.bottomCenter,
              imageUrlOrPath: userProfileService.currentUser?.photoURL,
            ),
            info: const FluppSliverAppBarInfoSettings(show: true),
          ),
          bottomNavigation: Constants.bottomNavBarSettings),
      slivers: const [DummySliverList()],
    );
  }
}
