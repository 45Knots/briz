part of 'flupp_scaffold.dart';

class FluppScaffoldSettings {
  const FluppScaffoldSettings({
    this.appBarSettings = const FluppSliverAppBarSettings(),
    this.showAppBar = true,
  });

  final FluppSliverAppBarSettings appBarSettings;
  final bool showAppBar;
}
