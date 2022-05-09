import 'package:briz/components/flupp/flupp_sliverappbar.dart';
import 'package:briz/screens/home_screen.dart';
import 'package:briz/screens/login_screen.dart';
import 'package:briz/screens/profile_screen.dart';
import 'package:briz/screens/sandbox_screen.dart';
import 'package:briz/services/userprofile_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'flupp_scaffold.settings.dart';

class FluppScaffold extends StatefulWidget {
  const FluppScaffold({
    Key? key,
    required this.screenIndex,
    required this.slivers,
    this.settings = const FluppScaffoldSettings(),
  }) : super(
          key: key,
        );

  final int screenIndex;
  final List<Widget> slivers;
  final FluppScaffoldSettings settings;

  @override
  State<FluppScaffold> createState() => _FluppScaffoldState();
}

class _FluppScaffoldState extends State<FluppScaffold> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: widget.settings.showAppBar
            ? [
                FluppSliverAppBar(
                  scrollController: _scrollController,
                  settings: widget.settings.appBar,
                ),
                ...widget.slivers,
              ]
            : widget.slivers,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget.screenIndex > -1 ? widget.screenIndex : 0, // this will be set when a new tab is tapped
          elevation: 30,
          onTap: (index) {
            String? currentRoute = ModalRoute.of(context)?.settings.name;
            if (currentRoute == null || currentRoute != widget.settings.bottomNavigation.buttons[index].targetRoute) {
              String targetRoute = widget.settings.bottomNavigation.buttons[index].targetRoute;
              if (widget.settings.bottomNavigation.buttons[index].nonAuthenticatedTargetRoute != null) {
                var userProfileService = Provider.of<UserProfileService>(context, listen: false);
                if (userProfileService.currentUser == null) {
                  targetRoute = widget.settings.bottomNavigation.buttons[index].nonAuthenticatedTargetRoute!;
                }
              }

              if (widget.settings.bottomNavigation.buttons[index].shoudlReplaceRoute) {
                Navigator.of(context).pushReplacementNamed(targetRoute);
              } else {
                Navigator.of(context).pushNamed(targetRoute);
              }
            }

            //  if (widget.screenIndex != index) {
            //   switch (index) {
            //     case 0:
            //       {
            //         Navigator.of(context).pushNamed(HomeScreen.routeId);
            //       }
            //       break;
            //     case 1:
            //       {
            //         var userProfileService = Provider.of<UserProfileService>(context, listen: false);
            //         if (userProfileService.currentUser == null) {
            //           Navigator.of(context).pushNamed(LoginScreen.routeId);
            //         } else {
            //           Navigator.of(context).pushNamed(ProfileScreen.routeId);
            //         }
            //       }
            //       break;
            //     case 2:
            //       {
            //         Navigator.of(context).pushNamed(SandboxScreen.routeId);
            //       }
            //   }
            // }
          },
          items: widget.settings.bottomNavigation.buttons
              .map<BottomNavigationBarItem>((settings) => BottomNavigationBarItem(
                    icon: Icon(
                      settings.icon,
                      color: widget.screenIndex == 0 ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                    ),
                    label: settings.label,
                  ))
              .toList()
          // [
          //   BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.home,
          //       color: widget.screenIndex == 0 ? Colors.red : Colors.blue,
          //     ),
          //     label: 'Home',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.person,
          //       color: widget.screenIndex == 1 ? Colors.red : Colors.blue,
          //     ),
          //     label: 'My profile',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.settings,
          //       color: widget.screenIndex == 2 ? Colors.red : Colors.blue,
          //     ),
          //     label: 'Settings',
          //   )
          // ],
          ),
    );
  }
}
