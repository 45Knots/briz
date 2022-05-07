import 'package:flutter/material.dart';
import '../components/dummy_sliver_list.dart';
import '../components/my_scaffold.dart';

class SandboxScreen extends StatefulWidget {
  const SandboxScreen({Key? key}) : super(key: key);
  static const String routeId = 'sanbdox_screen';
  @override
  State<SandboxScreen> createState() => _SandboxScreenState();
}

class _SandboxScreenState extends State<SandboxScreen> {
  double expandedTitleScale = 2;

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      screenIndex: 2,
      slivers: [
        // SliverToBoxAdapter(
        //   child: MyAvatar(),
        // ),
        DummySliverList(),
      ],
    );
  }
}

// class MyAvatar extends StatefulWidget {
//   const MyAvatar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MyAvatar> createState() => _MyAvatarState();
// }

// class _MyAvatarState extends State<MyAvatar> {
//   @override
//   final _avatarKey = GlobalKey();
//   double _size = 300;
//   void initState() {
//     super.initState();

// //    WidgetsBinding.instance?.addPostFrameCallback(_getWidgetInfo);
//   }

//   void _getWidgetInfo(_) {
//     final RenderBox renderBox = _avatarKey.currentContext?.findRenderObject() as RenderBox;
//     _avatarKey.currentContext?.size;

//     final Size size = renderBox.size;
//     print('Size: ${size.width}, ${size.height}');

//     final Offset offset = renderBox.globalToLocal(Offset.zero);
//     print('Offset: ${offset.dx}, ${offset.dy}');
//     print('Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       color: Colors.blue,
//       key: _avatarKey,
//       width: _size,
//       height: _size,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 5,
//         vertical: 5,
//       ),
//       child: CircleAvatar(
//         backgroundColor: Colors.black,
//         radius: 40.0,
//       ),
//     );
//   }
// }
