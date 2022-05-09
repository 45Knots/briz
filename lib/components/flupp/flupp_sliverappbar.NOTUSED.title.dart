part of 'flupp_sliverappbar.dart';

// class _DynamicFlexibleSpaceBarTitle extends StatefulWidget {
//   @required
//   final MySliverAppBarTitleSettings titleSettings;
//   final MySliverAppBarAvatarSettings avatarSettings;

//   const _DynamicFlexibleSpaceBarTitle({required this.titleSettings, required this.avatarSettings});

//   @override
//   State<StatefulWidget> createState() => _DynamicFlexibleSpaceBarTitleState();
// }

// class _DynamicFlexibleSpaceBarTitleState extends State<_DynamicFlexibleSpaceBarTitle> {
//   ScrollPosition? _position;
//   double _bottomPadding = 0;
//   late bool isCollapsed;
//   late bool isFullyExpanded;
//   final int paddingStep = 5;
//   late int currentStep = 0;
//   late double currentExtent = 0;
//   late FlexibleSpaceBarSettings? currentSettings;
//   @override
//   void dispose() {
//     _removeListener();
//     super.dispose();
//   }

//   @override
//   void didChangeDependencies() {
//     _removeListener();
//     _addListener();
//     super.didChangeDependencies();
//   }

//   void _addListener() {
//     _position = Scrollable.of(context)?.position;
//     _position?.addListener(_positionListener);
//     _positionListener();
//   }

//   void _removeListener() => _position?.removeListener(_positionListener);

//   void _positionListener() {
//     final FlexibleSpaceBarSettings? settings = context.dependOnInheritedWidgetOfExactType();
//     if (settings != null) {
//       setState(() {
//         currentSettings = settings;
//         // _bottomPadding = getPadding(settings.minExtent.toInt(), settings.maxExtent.toInt(), settings.currentExtent.toInt());
//         isCollapsed = settings.currentExtent == settings.minExtent;
//         isFullyExpanded = settings.currentExtent == settings.maxExtent;
//         currentExtent = settings.currentExtent;
//       });
//     }
//   }

//   double getPadding(int minExtent, int maxExtent, int currentExtent) {
//     int onePaddingExtent = ((maxExtent - minExtent) / 10).round();
//     int step = 0;
//     // double minPadding = (minExtent / paddingStep);
//     //double minPadding = onePaddingExtent * 1;
//     double padding = 0;
//     while (padding == 0) {
//       if (currentExtent >= minExtent + (step * onePaddingExtent) && currentExtent <= minExtent + ((step + 1) * onePaddingExtent)) {
//         // padding = minPadding + (step * paddingStep);
//         padding = step * paddingStep * 1;
//         currentStep = step;
//       } else {
//         step++;
//       }
//     }
//     return padding;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Widget title = Padding(
//     //   padding: EdgeInsets.fromLTRB(20, 0, 20, _bottomPadding),
//     //   child: Text(
//     //     widget.titleSettings.text,
//     //     style: widget.titleSettings.textStyle,
//     //     overflow: TextOverflow.visible,
//     //     maxLines: 1,
//     //     textAlign: TextAlign.center,
//     //   ),
//     // );

//     Widget title = Container(
//       // color: Colors.red,
//       alignment: Alignment.centerLeft,
//       child: Text(
//         widget.titleSettings.text,
//         style: widget.titleSettings.textStyle,
//         overflow: TextOverflow.visible,
//         maxLines: 1,
//         textAlign: TextAlign.center,
//       ),
//     );

//     var avatar = Align(
//       alignment: widget.avatarSettings.alignment,
//       child: const Padding(
//         padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//         child: CircleAvatar(
//           backgroundColor: Colors.black,
//           radius: 20.0,
//         ),
//       ),
//     );
//     // print(currentSettings);
//     var container = Container(
//       color: Colors.black.withOpacity(0.6),
//       height: 20,
//       child: Padding(
//         padding: const EdgeInsets.all(1.0),
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: widget.avatarSettings.actions,
//         ),
//       ),
//     );

//     List<Widget> widgets = [title, avatar, container];
//     // if (widget.avatarSettings.show) {
//     //   if (!isCollapsed) {
//     //     widgets = [...widgets, avatar];
//     //   }
//     // }
//     // return Stack(
//     //   alignment: Alignment.bottomCenter,
//     //   children: widgets,
//     // );
//     return title;
//   }
// }
