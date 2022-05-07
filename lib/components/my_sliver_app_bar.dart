import 'package:extended_image/extended_image.dart';
import "package:flutter/material.dart";
import '../constants.dart';

part 'my_sliver_app_bar.settings.title.dart';
part 'my_sliver_app_bar.settings.image.dart';
part 'my_sliver_app_bar.settings.avatar.dart';
part 'my_sliver_app_bar.settings.dart';
part 'my_sliver_app_bar.NOTUSED.title.dart';

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({
    Key? key,
    this.settings = const MySliverAppBarSettings(),
  }) : super(key: key);

  final MySliverAppBarSettings settings;
  @override
  _MySliverAppBarState createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: widget.settings.pinned,
      snap: widget.settings.snap,
      floating: widget.settings.floating,
      expandedHeight: (widget.settings.isCollaped ? widget.settings.collapsedHeight : widget.settings.expandedHeight),
      collapsedHeight: widget.settings.collapsedHeight,
      toolbarHeight: widget.settings.toolbarHeight,
      elevation: widget.settings.elevation,
      forceElevated: false,
      primary: true,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final FlexibleSpaceBarSettings? _settings = context.dependOnInheritedWidgetOfExactType();
          bool isCollapsed = _settings != null && _settings.currentExtent == _settings.minExtent;
          double height = MediaQuery.of(context).size.height;
          return FlexibleSpaceBar(
            titlePadding: isCollapsed
                ? const EdgeInsets.only(top: 30)
                : widget.settings.title.alignment == Alignment.bottomCenter
                    ? const EdgeInsets.only(bottom: 5)
                    : EdgeInsets.zero,
            centerTitle: false,
            expandedTitleScale: widget.settings.scale,
            background: MyImage(
              settings: widget.settings.image,
            ),
            title: SizedBox(
              height: (height / widget.settings.scale) * 0.25,
              child: Align(
                alignment: isCollapsed ? Alignment.center : widget.settings.title.alignment,
                child: Text(
                  widget.settings.title.text,
                  style: widget.settings.title.textStyle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyImage extends StatefulWidget {
  const MyImage({Key? key, this.settings = const MySliverAppBarImageSettings()}) : super(key: key);

  final MySliverAppBarImageSettings settings;
  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  @override
  Widget build(BuildContext context) {
    return widget.settings.path.startsWith('assets/')
        ? Image.asset(
            widget.settings.path,
            fit: widget.settings.fit,
            color: widget.settings.color.withOpacity(widget.settings.opacity),
            colorBlendMode: BlendMode.modulate,
          )
        : ExtendedImage.network(
            widget.settings.path,
            fit: widget.settings.fit,
            color: widget.settings.color.withOpacity(widget.settings.opacity),
            colorBlendMode: BlendMode.modulate,
            enableLoadState: true,
            cache: true,
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                case LoadState.failed:
                  return Image.asset(
                    kDefaultAppBarImagePath,
                    fit: widget.settings.fit,
                    color: widget.settings.color.withOpacity(widget.settings.opacity),
                    colorBlendMode: BlendMode.modulate,
                  );
                case LoadState.completed:
                  return state.completedWidget;
              }
            },
          );
  }
}
