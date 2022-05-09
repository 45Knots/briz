part of 'flupp_sliverappbar.dart';

class FluppSliverAppBarAvatarSettings {
  const FluppSliverAppBarAvatarSettings({
    this.show = true,
    this.actions = const [],
    this.alignment = Alignment.bottomLeft,
  });

  final bool show;
  final List<Widget> actions;
  final Alignment alignment;
}
