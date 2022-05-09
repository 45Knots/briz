part of 'flupp_sliverappbar.dart';

class FluppSliverAppBarSettings {
  static const defaultExpandedHeight = 200.0;

  const FluppSliverAppBarSettings({
    this.isCollaped = false,
    this.expandedHeight = defaultExpandedHeight,
    this.collapsedHeight = kToolbarHeight,
    this.toolbarHeight = kToolbarHeight,
    this.pinned = true,
    this.snap = false,
    this.floating = false,
    this.elevation = 0.0,
    this.scale = 2,
    this.title = const FluppSliverAppBarTitleSettings(),
    this.image = const FluppSliverAppBarImageSettings(),
    this.avatar = const FluppSliverAppBarAvatarSettings(),
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

  final FluppSliverAppBarTitleSettings title;
  final FluppSliverAppBarImageSettings image;
  final FluppSliverAppBarAvatarSettings avatar;

  // static const MySliverAppBarSettings defaultSettings = MySliverAppBarSettings();
}
