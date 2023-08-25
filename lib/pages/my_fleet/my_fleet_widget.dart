import '/auth/firebase_auth/auth_util.dart';
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
import 'my_fleet_model.dart';
export 'my_fleet_model.dart';

class MyFleetWidget extends StatefulWidget {
  const MyFleetWidget({Key? key}) : super(key: key);

  @override
  _MyFleetWidgetState createState() => _MyFleetWidgetState();
}

class _MyFleetWidgetState extends State<MyFleetWidget> {
  late MyFleetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyFleetModel());

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

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: true,
        title: Text(
          FFLocalizations.of(context).getText(
            's6ufqn8z' /* My Fleet */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Comfortaa',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 30.0,
            ),
            onPressed: () async {
              currentUserLocationValue = await getCurrentUserLocation(
                  defaultLocation: LatLng(0.0, 0.0));

              var cruisersRecordReference = CruisersRecord.collection.doc();
              await cruisersRecordReference.set(createCruisersRecordData(
                owner: currentUserReference,
                isTemp: true,
                cabins: 1,
                capacity: 2,
                host: createServiceStruct(
                  available: false,
                  clearUnsetFields: false,
                  create: true,
                ),
                length: 5.0,
                location: currentUserLocationValue,
              ));
              _model.newCruiser = CruisersRecord.getDocumentFromData(
                  createCruisersRecordData(
                    owner: currentUserReference,
                    isTemp: true,
                    cabins: 1,
                    capacity: 2,
                    host: createServiceStruct(
                      available: false,
                      clearUnsetFields: false,
                      create: true,
                    ),
                    length: 5.0,
                    location: currentUserLocationValue,
                  ),
                  cruisersRecordReference);

              context.pushNamed(
                'EditCruiser',
                queryParameters: {
                  'cruiserRef': serializeParam(
                    _model.newCruiser?.reference,
                    ParamType.DocumentReference,
                  ),
                }.withoutNulls,
              );

              setState(() {});
            },
          ),
        ],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 40.0, 20.0, 40.0),
                            child: StreamBuilder<List<CruisersRecord>>(
                              stream: queryCruisersRecord(
                                queryBuilder: (cruisersRecord) => cruisersRecord
                                    .where('is_temp', isNotEqualTo: true)
                                    .where('owner',
                                        isEqualTo: currentUserReference),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 100.0,
                                      height: 100.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 100.0,
                                      ),
                                    ),
                                  );
                                }
                                List<CruisersRecord> wrapCruisersRecordList =
                                    snapshot.data!;
                                return Wrap(
                                  spacing: 50.0,
                                  runSpacing: 50.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: List.generate(
                                      wrapCruisersRecordList.length,
                                      (wrapIndex) {
                                    final wrapCruisersRecord =
                                        wrapCruisersRecordList[wrapIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'CruiserView',
                                          queryParameters: {
                                            'cruiserRef': serializeParam(
                                              wrapCruisersRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: CardCruiserWidget(
                                        key: Key(
                                            'Keyxyt_${wrapIndex}_of_${wrapCruisersRecordList.length}'),
                                        showDetailsRow: true,
                                        cruiserRef:
                                            wrapCruisersRecord.reference,
                                        showTitle: true,
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Container(
                            width: double.infinity,
                            height: 5.0,
                            constraints: BoxConstraints(
                              maxHeight: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                              borderRadius: BorderRadius.circular(2.0),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 40.0, 20.0, 40.0),
                            child: StreamBuilder<List<CruisersRecord>>(
                              stream: queryCruisersRecord(
                                queryBuilder: (cruisersRecord) => cruisersRecord
                                    .where('is_temp', isEqualTo: true)
                                    .where('owner',
                                        isEqualTo: currentUserReference),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 100.0,
                                      height: 100.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 100.0,
                                      ),
                                    ),
                                  );
                                }
                                List<CruisersRecord> wrapCruisersRecordList =
                                    snapshot.data!;
                                return Wrap(
                                  spacing: 50.0,
                                  runSpacing: 50.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: List.generate(
                                      wrapCruisersRecordList.length,
                                      (wrapIndex) {
                                    final wrapCruisersRecord =
                                        wrapCruisersRecordList[wrapIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'CruiserView',
                                          queryParameters: {
                                            'cruiserRef': serializeParam(
                                              wrapCruisersRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: CardCruiserWidget(
                                        key: Key(
                                            'Keylw1_${wrapIndex}_of_${wrapCruisersRecordList.length}'),
                                        showDetailsRow: true,
                                        cruiserRef:
                                            wrapCruisersRecord.reference,
                                        showTitle: true,
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
