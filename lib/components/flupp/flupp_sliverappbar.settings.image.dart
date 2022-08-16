part of 'flupp_sliverappbar.dart';

class FluppSliverAppBarImageSettings {
  const FluppSliverAppBarImageSettings({
    this.path = Constants.defaultAppBarImagePath,
    this.fit = BoxFit.cover,
    this.opacity = 0.5,
    this.color = Colors.white,
    this.paths,
  });

  final String path;
  final BoxFit fit;
  final double opacity;
  final Color color;
  final List<String>? paths;
}
