part of 'flupp_sliverappbar.dart';

class FluppSliverAppBarAvatarSettings {
  const FluppSliverAppBarAvatarSettings({
    this.imageUrlOrPath,
    this.show = false,
    this.alignment = Alignment.bottomCenter,
  });

  final bool show;
  final Alignment alignment;
  final String? imageUrlOrPath;
}
