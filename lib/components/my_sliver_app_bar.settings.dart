part of 'my_sliver_app_bar.dart';

class MySliverAppBarSettings {
  static const defaultExpandedHeight = 200.0;

  const MySliverAppBarSettings({
    this.isCollaped = false,
    this.expandedHeight = defaultExpandedHeight,
    this.collapsedHeight = kToolbarHeight,
    this.toolbarHeight = kToolbarHeight,
    this.pinned = true,
    this.snap = false,
    this.floating = false,
    this.elevation = 0.0,
    this.scale = 2,
    this.title = const MySliverAppBarTitleSettings(),
    this.image = const MySliverAppBarImageSettings(),
    this.avatar = const MySliverAppBarAvatarSettings(),
  });

  final bool isCollaped;
  final double expandedHeight;
  final double collapsedHeight;
  final double toolbarHeight;
  final bool pinned;
  final bool snap;
  final bool floating;
  final double elevation;
  final double scale;

  final MySliverAppBarTitleSettings title;
  final MySliverAppBarImageSettings image;
  final MySliverAppBarAvatarSettings avatar;

  // static const MySliverAppBarSettings defaultSettings = MySliverAppBarSettings();
}
