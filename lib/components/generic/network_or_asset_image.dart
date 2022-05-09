import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class NetworkOrAssetImage extends StatefulWidget {
  const NetworkOrAssetImage({
    Key? key,
    this.imagePathOrUrl,
    this.fit = BoxFit.cover,
    this.color,
    this.opacity = 1,
    this.fallBackImagePath,
    this.fallBackIcon,
    this.loadingWidget,
  }) : super(key: key);

  final String? imagePathOrUrl;
  final String? fallBackImagePath;
  final IconData? fallBackIcon;
  final BoxFit fit;
  final Color? color;
  final double opacity;
  final Widget? loadingWidget;

  @override
  State<NetworkOrAssetImage> createState() => _NetworkOrAssetImageState();
}

class _NetworkOrAssetImageState extends State<NetworkOrAssetImage> {
  @override
  Widget build(BuildContext context) {
    Widget? fallBackWidget = widget.fallBackImagePath != null
        ? Image.asset(
            widget.fallBackImagePath!,
            fit: widget.fit,
            color: widget.color?.withOpacity(widget.opacity),
            colorBlendMode: BlendMode.modulate,
          )
        : widget.fallBackIcon != null
            ? FittedBox(
                child: Icon(
                  widget.fallBackIcon,
                  color: widget.color?.withOpacity(widget.opacity),
                ),
                fit: widget.fit,
              )
            : const Placeholder();
    return widget.imagePathOrUrl == null || widget.imagePathOrUrl!.isEmpty
        ? fallBackWidget
        : isURL(widget.imagePathOrUrl!)
            ? ExtendedImage.network(
                widget.imagePathOrUrl!,
                fit: widget.fit,
                color: widget.color?.withOpacity(widget.opacity),
                colorBlendMode: BlendMode.modulate,
                enableLoadState: true,
                cache: true,
                loadStateChanged: (ExtendedImageState state) {
                  switch (state.extendedImageLoadState) {
                    case LoadState.loading:
                      return widget.loadingWidget;
                    case LoadState.failed:
                      return fallBackWidget;
                    case LoadState.completed:
                      return state.completedWidget;
                  }
                },
              )
            : ExtendedImage.asset(
                widget.imagePathOrUrl!,
                fit: widget.fit,
                color: widget.color?.withOpacity(widget.opacity),
                colorBlendMode: BlendMode.modulate,
              );
  }
}
