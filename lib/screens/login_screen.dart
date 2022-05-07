import 'dart:async';

import 'package:briz/components/my_scaffold.dart';
import 'package:briz/components/my_sliver_app_bar.dart';
import 'package:briz/screens/profile_screen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:briz/screens/home_screen.dart';
import 'package:briz/services/userprofile_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeId = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late StreamSubscription<User?> loginStateSubscription;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    var userProfileService = Provider.of<UserProfileService>(context, listen: false);
    loginStateSubscription = userProfileService.userChanges.listen((user) {
      if (user != null) {
        Navigator.of(context).pushReplacementNamed(ProfileScreen.routeId);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userProfileService = Provider.of<UserProfileService>(context);
    return MyScaffold(
      screenIndex: 1,
      settings: const MyScaffoldSettings(
        appBarSettings: MySliverAppBarSettings(title: MySliverAppBarTitleSettings(text: "Briz")),
      ),
      slivers: [
        SliverToBoxAdapter(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 25.0,
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                SignInButton(
                  Buttons.Google,
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.Apple,
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.FacebookNew,
                  onPressed: () {
                    userProfileService.loginFacebook();
                  },
                ),
                SignInButton(
                  Buttons.Twitter,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
