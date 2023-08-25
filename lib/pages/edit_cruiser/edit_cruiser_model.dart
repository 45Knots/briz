import '/backend/backend.dart';
import '/components/view_cruiser_details/view_cruiser_details_widget.dart';
import '/components/view_cruiser_gallery/view_cruiser_gallery_widget.dart';
import '/components/view_cruiser_pricelist/view_cruiser_pricelist_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditCruiserModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for viewCruiserDetails component.
  late ViewCruiserDetailsModel viewCruiserDetailsModel;
  // Model for viewCruiserGallery component.
  late ViewCruiserGalleryModel viewCruiserGalleryModel;
  // Model for viewCruiserPricelist component.
  late ViewCruiserPricelistModel viewCruiserPricelistModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    viewCruiserDetailsModel =
        createModel(context, () => ViewCruiserDetailsModel());
    viewCruiserGalleryModel =
        createModel(context, () => ViewCruiserGalleryModel());
    viewCruiserPricelistModel =
        createModel(context, () => ViewCruiserPricelistModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    viewCruiserDetailsModel.dispose();
    viewCruiserGalleryModel.dispose();
    viewCruiserPricelistModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
