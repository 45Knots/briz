part of 'flupp_sliverappbar.dart';

class FluppSliverAppBarTitleSettings {
  const FluppSliverAppBarTitleSettings({
    this.text = "",
    this.textStyle = kTitleTextStyle,
    this.alignment = Alignment.center,
    this.backgroundColor = Colors.transparent,
  });

  final String text;
  final TextStyle textStyle;
  final Alignment alignment;
  final Color backgroundColor;
}
