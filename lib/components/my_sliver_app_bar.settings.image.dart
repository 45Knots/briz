part of 'my_sliver_app_bar.dart';

class MySliverAppBarImageSettings {
  const MySliverAppBarImageSettings({
    this.path = kDefaultAppBarImagePath,
    this.fit = BoxFit.cover,
    this.opacity = 0.5,
    this.color = Colors.white,
  });

  final String path;
  final BoxFit fit;
  final double opacity;
  final Color color;
}
