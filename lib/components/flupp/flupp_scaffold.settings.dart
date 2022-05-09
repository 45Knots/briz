part of 'flupp_scaffold.dart';

class FluppScaffoldSettings {
  const FluppScaffoldSettings({
    this.appBar = const FluppSliverAppBarSettings(),
    this.bottomNavigation = const FluppBottomNavigationSettings(),
    this.showAppBar = true,
  });

  final FluppSliverAppBarSettings appBar;
  final FluppBottomNavigationSettings bottomNavigation;
  final bool showAppBar;
}

class FluppBottomNavigationButtonSettings {
  const FluppBottomNavigationButtonSettings({
    required this.icon,
    required this.targetRoute,
    this.nonAuthenticatedTargetRoute,
    this.label,
    this.shoudlReplaceRoute = false,
  });

  final IconData icon;
  final String targetRoute;
  final String? nonAuthenticatedTargetRoute;
  final bool shoudlReplaceRoute;
  final String? label;
}

class FluppBottomNavigationSettings {
  const FluppBottomNavigationSettings({
    this.show = true,
    this.buttons = const [],
  });

  final bool show;
  final List<FluppBottomNavigationButtonSettings> buttons;
}
