import 'package:flutter/material.dart';

class EffectParameters {
  const EffectParameters({
    this.startAtOffset = 0,
    this.stopAtOffset = 0,
  });

  final double startAtOffset;
  final double stopAtOffset;

  bool get shouldApply => startAtOffset != stopAtOffset;
}

enum ScaleType { grow, shrink }

class ScaleEffectParameters extends EffectParameters {
  const ScaleEffectParameters({
    double startAtOffset = 0,
    double stopAtOffset = 0,
    this.scaleFactor = 1,
    this.alignment = Alignment.center,
    this.type = ScaleType.grow,
  }) : super(
          stopAtOffset: stopAtOffset,
          startAtOffset: startAtOffset,
        );

  final double scaleFactor;
  final Alignment alignment;
  final ScaleType type;
}

class ScrollEffects extends StatefulWidget {
  const ScrollEffects({
    Key? key,
    required this.scrollController,
    required this.child,
    this.fadeEffect = const EffectParameters(),
    this.scaleEffect = const ScaleEffectParameters(),
  }) : super(key: key);

  // final ScrollController scrollController;
  final Widget child;
  final EffectParameters fadeEffect;
  final ScaleEffectParameters scaleEffect;
  final ScrollController scrollController;
  @override
  _ScrollEffectsState createState() => _ScrollEffectsState();
}

class _ScrollEffectsState extends State<ScrollEffects> {
  double _offset = 0;
  @override
  initState() {
    super.initState();
    if (widget.scrollController.hasClients) {
      widget.scrollController.addListener(_setOffset);
    }
  }

  @override
  dispose() {
    widget.scrollController.removeListener(_setOffset);
    super.dispose();
  }

  void _setOffset() {
    setState(() {
      if (widget.scrollController.hasClients) {
        _offset = widget.scrollController.offset;
      }
    });
  }

  double get currentOpacity => ((widget.fadeEffect.startAtOffset + widget.fadeEffect.stopAtOffset - _offset) / widget.fadeEffect.stopAtOffset).clamp(0, 1).toDouble();
  Matrix4 currentScale() {
    final double deltaExtent = widget.scaleEffect.stopAtOffset - widget.scaleEffect.startAtOffset;
    final double t = (1.0 - (_offset - widget.scaleEffect.startAtOffset) / deltaExtent).clamp(0.0, 1.0);
    final double scaleValue = Tween<double>(
      begin: widget.scaleEffect.type == ScaleType.shrink ? 1.0 : widget.scaleEffect.scaleFactor,
      end: widget.scaleEffect.type == ScaleType.shrink ? widget.scaleEffect.scaleFactor : 1.0,
    ).transform(t);
    return Matrix4.identity()..scale(scaleValue, scaleValue, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget = widget.child;
    if (widget.fadeEffect.shouldApply) {
      _widget = Opacity(opacity: currentOpacity, child: widget.child);
    }

    return widget.scaleEffect.shouldApply
        ? Transform(
            alignment: widget.scaleEffect.alignment,
            transform: currentScale(),
            child: _widget,
          )
        : _widget;
  }
}
