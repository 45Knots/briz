import 'package:briz/components/generic/network_or_asset_image.dart';
import 'package:briz/components/generic/scroll_effects.dart';
import 'package:briz/components/generic/network_or_asset_avatar.dart';
import 'package:briz/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    Widget appBar = SliverAppBar(
      pinned: widget.settings.pinned,
      snap: widget.settings.snap,
      floating: widget.settings.floating,
      expandedHeight: (widget.settings.isCollaped ? widget.settings.collapsedHeight : widget.settings.expandedHeight),
      collapsedHeight: widget.settings.collapsedHeight,
      toolbarHeight: widget.settings.toolbarHeight,
      elevation: widget.settings.elevation,
      forceElevated: false,
      primary: true,
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 32,
      ),
      actions: widget.settings.actions
          .map<Widget>(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Ink(
                // width: 42,
                // decoration: ShapeDecoration(
                //   shape: CircleBorder(),
                //   color: Theme.of(context).shadowColor.withOpacity(0.9),
                // ),
                child: e,
              ),
            ),
          )
          .toList(),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final FlexibleSpaceBarSettings? settings = context.dependOnInheritedWidgetOfExactType();
          bool isCollapsed = settings != null && settings.currentExtent == settings.minExtent;
          double height = MediaQuery.of(context).size.height;
          return FlexibleSpaceBar(
            titlePadding: isCollapsed
                ? const EdgeInsets.only(top: 30)
                : widget.settings.title.alignment == Alignment.bottomCenter
                    ? const EdgeInsets.only(bottom: 5)
                    : EdgeInsets.zero,
            centerTitle: false,
            expandedTitleScale: widget.settings.scale,
            background: widget.settings.image.paths == null
                ? NetworkOrAssetImage(
                    imagePathOrUrl: widget.settings.image.path,
                    color: widget.settings.image.color,
                    fit: widget.settings.image.fit,
                    opacity: widget.settings.image.opacity,
                    fallBackImagePath: Constants.defaultAppBarImagePath,
                  )
                : CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      disableCenter: true,
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                    ),
                    carouselController: CarouselController(),
                    items: widget.settings.image.paths!
                        .map(
                          (e) => Builder(
                            builder: (context) => NetworkOrAssetImage(
                              imagePathOrUrl: e,
                              color: widget.settings.image.color,
                              fit: widget.settings.image.fit,
                              opacity: widget.settings.image.opacity,
                              fallBackImagePath: Constants.defaultAppBarImagePath,
                            ),
                          ),
                        )
                        .toList(),
                  ),
            title: SizedBox(
              width: double.infinity,
              height: (height / widget.settings.scale) * 0.25,
              child: Align(
                alignment: isCollapsed ? Alignment.center : widget.settings.title.alignment,
                child: isCollapsed
                    ? Text(
                        widget.settings.title.text,
                        style: widget.settings.title.textStyle,
                      )
                    : Container(
                        width: double.infinity,
                        alignment: isCollapsed ? Alignment.center : widget.settings.title.alignment,
                        height: widget.settings.title.textStyle.fontSize! * 2,
                        color: widget.settings.title.backgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            widget.settings.title.text,
                            style: widget.settings.title.textStyle,
                          ),
                        ),
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

    Widget infoBar = AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: kToolbarHeight / 2,
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0,
    );

    List<Widget> children = List<Widget>.empty(growable: true);
    children.add(widget.settings.avatar.show ? SliverStack(children: [SliverPositioned.fill(child: appBar), avatar]) : appBar);
    if (widget.settings.info.show) {
      children.add(infoBar);
    }
    return MultiSliver(children: children);
  }
}
