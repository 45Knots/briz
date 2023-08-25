// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;

Future updateImageList(
  List<String> imageList,
  List<String> imagesToAdd,
) async {
  Set<String> imageSet = imageList.toSet();
  imageSet.addAll(imagesToAdd);
  return imageSet.toList();
}
