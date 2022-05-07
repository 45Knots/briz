part of 'my_sliver_app_bar.dart';

class MySliverAppBarAvatarSettings {
  const MySliverAppBarAvatarSettings({
    this.show = true,
    this.actions = const [],
    this.alignment = Alignment.bottomLeft,
  });

  final bool show;
  final List<Widget> actions;
  final Alignment alignment;
}
