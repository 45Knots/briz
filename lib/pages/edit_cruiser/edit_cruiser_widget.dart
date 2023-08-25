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
import 'edit_cruiser_model.dart';
export 'edit_cruiser_model.dart';

class EditCruiserWidget extends StatefulWidget {
  const EditCruiserWidget({
    Key? key,
    this.cruiserRef,
  }) : super(key: key);

  final DocumentReference? cruiserRef;

  @override
  _EditCruiserWidgetState createState() => _EditCruiserWidgetState();
}

class _EditCruiserWidgetState extends State<EditCruiserWidget>
    with TickerProviderStateMixin {
  late EditCruiserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditCruiserModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<CruisersRecord>(
      stream: CruisersRecord.getDocument(widget.cruiserRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 100.0,
                ),
              ),
            ),
          );
        }
        final editCruiserCruisersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: true,
              title: Text(
                editCruiserCruisersRecord.title,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            isScrollable: true,
                            labelColor: FlutterFlowTheme.of(context).primary,
                            labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                            unselectedLabelStyle: TextStyle(),
                            indicatorColor:
                                FlutterFlowTheme.of(context).secondary,
                            tabs: [
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'qcsjkaum' /* Details */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  '6570cskg' /* Photo Gallery */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'ndq0r9zf' /* Pricing */,
                                ),
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (value) => setState(() {}),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              KeepAliveWidgetWrapper(
                                builder: (context) => wrapWithModel(
                                  model: _model.viewCruiserDetailsModel,
                                  updateCallback: () => setState(() {}),
                                  child: ViewCruiserDetailsWidget(
                                    cruiserRef: widget.cruiserRef,
                                  ),
                                ),
                              ),
                              KeepAliveWidgetWrapper(
                                builder: (context) => wrapWithModel(
                                  model: _model.viewCruiserGalleryModel,
                                  updateCallback: () => setState(() {}),
                                  child: ViewCruiserGalleryWidget(
                                    cruiserRef: widget.cruiserRef,
                                  ),
                                ),
                              ),
                              KeepAliveWidgetWrapper(
                                builder: (context) => wrapWithModel(
                                  model: _model.viewCruiserPricelistModel,
                                  updateCallback: () => setState(() {}),
                                  child: ViewCruiserPricelistWidget(
                                    cruiserRef: widget.cruiserRef,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
