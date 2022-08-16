import 'package:briz/components/flupp/flupp_sliverappbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Theme.of(context).backgroundColor,
      body: RefreshIndicator(
        onRefresh: () {
          if (kDebugMode) {
            print("refreshing");
          }
          return Future.value(true);
        },
        child: CustomScrollView(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget.screenIndex > -1 ? widget.screenIndex : 0, // this will be set when a new tab is tapped
          backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.5),
          elevation: 100,
          onTap: (index) {
            String? currentRoute = ModalRoute.of(context)?.settings.name;
            if (currentRoute == null || currentRoute != widget.settings.bottomNavigation.buttons[index].targetRoute) {
              String targetRoute = widget.settings.bottomNavigation.buttons[index].targetRoute;
              if (widget.settings.bottomNavigation.buttons[index].nonAuthenticatedTargetRoute != null) {
                if (FirebaseAuth.instance.currentUser == null) {
                  targetRoute = widget.settings.bottomNavigation.buttons[index].nonAuthenticatedTargetRoute!;
                }
              }

              if (widget.settings.bottomNavigation.buttons[index].shoudlReplaceRoute) {
                Navigator.of(context).pushReplacementNamed(targetRoute);
              } else {
                Navigator.of(context).pushNamed(targetRoute);
              }
            }
          },
          items: widget.settings.bottomNavigation.buttons
              .map<BottomNavigationBarItem>((settings) => BottomNavigationBarItem(
                    icon: Icon(
                      settings.icon,
                      color: widget.screenIndex == 0 ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                    ),
                    label: settings.label,
                  ))
              .toList()),
    );
  }
}
