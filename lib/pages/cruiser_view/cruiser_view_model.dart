import '/backend/backend.dart';
import '/components/card_cruiser/card_cruiser_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CruiserViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cardCruiser component.
  late CardCruiserModel cardCruiserModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cardCruiserModel = createModel(context, () => CardCruiserModel());
  }

  void dispose() {
    unfocusNode.dispose();
    cardCruiserModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
