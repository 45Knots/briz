import 'package:briz/components/flupp/flupp_scaffold.dart';
import 'package:briz/components/flupp/flupp_sliverappbar.dart';
import 'package:briz/components/generic/dummy_sliver_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import '../constants.dart';

class UserProfileScreen extends StatefulWidget {
  static const String routeId = "userprofile_screen";
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return FluppScaffold(
      screenIndex: 1,
      settings: FluppScaffoldSettings(
          appBar: FluppSliverAppBarSettings(
            title: const FluppSliverAppBarTitleSettings(text: ""),
            pinned: true,
            expandedHeight: 100,
            avatar: FluppSliverAppBarAvatarSettings(
              show: FirebaseAuth.instance.currentUser == null ? false : true,
              alignment: Alignment.bottomCenter,
              imageUrlOrPath: FirebaseAuth.instance.currentUser == null ? "" : FirebaseAuth.instance.currentUser!.photoURL,
            ),
            info: FluppSliverAppBarInfoSettings(
              show: FirebaseAuth.instance.currentUser == null ? false : true,
            ),
          ),
          bottomNavigation: Constants.bottomNavBarSettings),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FirebaseAuth.instance.currentUser == null ? buildLoginView() : buildProfileView(),
          ),
        ),
      ],
    );
  }

  Widget buildLoginView() {
    return FlutterFireUIActions(
      actions: [
        AuthStateChangeAction(
          (context, state) => Navigator.pushReplacementNamed(context, UserProfileScreen.routeId),
        ),
      ],
      child: LoginView(
        action: AuthAction.signUp,
        providerConfigs: FlutterFireUIAuth.configsFor(
          Firebase.app('[DEFAULT]'),
        ),
        showAuthActionSwitch: true,
      ),
    );
  }

  Widget buildProfileView() {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.amber,
    );
  }
}
