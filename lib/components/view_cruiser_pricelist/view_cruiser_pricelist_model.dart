import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewCruiserPricelistModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for skipper widget.
  bool? skipperValue;
  // State field(s) for skipperPrice widget.
  TextEditingController? skipperPriceController;
  String? Function(BuildContext, String?)? skipperPriceControllerValidator;
  // State field(s) for host widget.
  bool? hostValue;
  // State field(s) for hostPrice widget.
  TextEditingController? hostPriceController;
  String? Function(BuildContext, String?)? hostPriceControllerValidator;
  // State field(s) for catering widget.
  bool? cateringValue;
  // State field(s) for cateringPrice widget.
  TextEditingController? cateringPriceController;
  String? Function(BuildContext, String?)? cateringPriceControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    skipperPriceController?.dispose();
    hostPriceController?.dispose();
    cateringPriceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
