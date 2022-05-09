import 'package:briz/components/scroll_effects.dart';
import 'package:briz/components/my_avatar.dart';
import 'package:briz/constants.dart';
import 'package:extended_image/extended_image.dart';
import "package:flutter/material.dart";
import 'package:sliver_tools/sliver_tools.dart';

part 'flupp_sliverappbar.settings.title.dart';
part 'flupp_sliverappbar.settings.image.dart';
part 'flupp_sliverappbar.settings.avatar.dart';
part 'flupp_sliverappbar.settings.dart';
part 'flupp_sliverappbar.NOTUSED.title.dart';

class FluppSliverAppBar extends StatefulWidget {
  const FluppSliverAppBar({
    Key? key,
    required this.scrollController,
    this.settings = const FluppSliverAppBarSettings(),
  }) : super(key: key);

  final FluppSliverAppBarSettings settings;
  final ScrollController scrollController;
  @override
  _FluppSliverAppBarState createState() => _FluppSliverAppBarState();
}

class _FluppSliverAppBarState extends State<FluppSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    Widget _appBar = SliverAppBar(
      pinned: widget.settings.pinned,
      // pinned: false,
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

    var avatar = SliverPositioned(
        bottom: -25,
        left: 10,
        child: ScrollEffects(
          fadeEffect: EffectParameters(
            startAtOffset: 0,
            stopAtOffset: widget.settings.expandedHeight - widget.settings.collapsedHeight,
          ),
          scaleEffect: ScaleEffectParameters(
            alignment: Alignment.centerLeft,
            startAtOffset: 0,
            stopAtOffset: widget.settings.expandedHeight - widget.settings.collapsedHeight,
            scaleFactor: 1.5,
            type: ScaleType.shrink,
          ),
          scrollController: widget.scrollController,
          child: MyAvatar(
            imageUrl: widget.settings.image.path,
          ),
        ));

    return MultiSliver(children: [
      SliverStack(children: [SliverPositioned.fill(child: _appBar), avatar]),
      _ss
    ]);
  }
}

var _ss = SliverPinnedHeader(child: _info);

var _info = MyInfoBar2();

class MyInfoBar2 extends StatelessWidget {
  const MyInfoBar2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            height: 40,
            color: Theme.of(context).backgroundColor,
            child: Text('BBBBBB'),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          height: 40,
          color: Theme.of(context).backgroundColor,
          child: Text('AAAAAAA'),
        ),
      ],
    );
  }
}

class MyImage extends StatefulWidget {
  const MyImage({Key? key, this.settings = const FluppSliverAppBarImageSettings()}) : super(key: key);

  final FluppSliverAppBarImageSettings settings;
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
