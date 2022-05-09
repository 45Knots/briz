import 'package:briz/components/generic/network_or_asset_image.dart';
import 'package:briz/components/generic/scroll_effects.dart';
import 'package:briz/components/generic/network_or_asset_avatar.dart';
import 'package:briz/constants.dart';
import "package:flutter/material.dart";
import 'package:sliver_tools/sliver_tools.dart';

part 'flupp_sliverappbar.settings.title.dart';
part 'flupp_sliverappbar.settings.image.dart';
part 'flupp_sliverappbar.settings.avatar.dart';
part 'flupp_sliverappbar.settings.infobar.dart';
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
            background: NetworkOrAssetImage(
              imagePathOrUrl: widget.settings.image.path,
              color: widget.settings.image.color,
              fit: widget.settings.image.fit,
              opacity: widget.settings.image.opacity,
              fallBackImagePath: Constants.defaultAppBarImagePath,
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

    Widget avatar = SliverPositioned(
        bottom: -40,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Align(
            alignment: widget.settings.avatar.alignment,
            child: ScrollEffects(
              fadeEffect: EffectParameters(
                startAtOffset: 0,
                stopAtOffset: widget.settings.expandedHeight - widget.settings.collapsedHeight,
              ),
              scaleEffect: ScaleEffectParameters(
                alignment: widget.settings.avatar.alignment,
                startAtOffset: 0,
                stopAtOffset: widget.settings.expandedHeight - widget.settings.collapsedHeight,
                scaleFactor: 1.5,
                type: ScaleType.shrink,
              ),
              scrollController: widget.scrollController,
              child: NetworkOrAssetAvatar(
                imagePathOrUrl: widget.settings.avatar.imageUrlOrPath,
              ),
            ),
          ),
        ));

    Widget _infoBar = AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: kToolbarHeight / 2,
      backgroundColor: Theme.of(context).canvasColor,
      elevation: 0,
    );

    List<Widget> _children = List<Widget>.empty(growable: true);
    _children.add(widget.settings.avatar.show ? SliverStack(children: [SliverPositioned.fill(child: _appBar), avatar]) : _appBar);
    if (widget.settings.info.show) {
      _children.add(_infoBar);
    }
    return MultiSliver(children: _children);
  }
}
