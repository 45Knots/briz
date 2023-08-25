import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_cruiser_model.dart';
export 'card_cruiser_model.dart';

class CardCruiserWidget extends StatefulWidget {
  const CardCruiserWidget({
    Key? key,
    this.cruiserRef,
    this.showDetailsRow,
    this.showTitle,
  }) : super(key: key);

  final DocumentReference? cruiserRef;
  final bool? showDetailsRow;
  final bool? showTitle;

  @override
  _CardCruiserWidgetState createState() => _CardCruiserWidgetState();
}

class _CardCruiserWidgetState extends State<CardCruiserWidget> {
  late CardCruiserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardCruiserModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
      child: StreamBuilder<CruisersRecord>(
        stream: CruisersRecord.getDocument(widget.cruiserRef!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 100.0,
                ),
              ),
            );
          }
          final containerCruisersRecord = snapshot.data!;
          return Container(
            width: 300.0,
            height: 400.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          containerCruisersRecord.image == ''
                              ? FFAppState().defaultCruiserImageUrl
                              : containerCruisersRecord.image,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                if (widget.showTitle ?? true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      containerCruisersRecord.title,
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).titleMedium,
                    ),
                  ),
                if (widget.showTitle ?? true)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: AutoSizeText(
                      containerCruisersRecord.model,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Comfortaa',
                            fontSize: 12.0,
                          ),
                    ),
                  ),
                if (widget.showDetailsRow ?? true)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 5.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.bed,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 11.0,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 0.0, 2.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '465yytc3' /* : */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Comfortaa',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 12.0,
                                ),
                          ),
                        ),
                        Text(
                          containerCruisersRecord.cabins.toString(),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Comfortaa',
                                    fontSize: 12.0,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 0.0),
                          child: Container(
                            width: 2.0,
                            height: 14.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.group,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 12.0,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 0.0, 2.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'xcj51wgl' /* : */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Comfortaa',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 12.0,
                                ),
                          ),
                        ),
                        Text(
                          containerCruisersRecord.capacity.toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Comfortaa',
                                    fontSize: 12.0,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 0.0),
                          child: Container(
                            width: 2.0,
                            height: 14.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          ),
                        ),
                        FaIcon(
                          FontAwesomeIcons.arrowsAltH,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 12.0,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 0.0, 2.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'h4ug6mof' /* : */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Comfortaa',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 12.0,
                                ),
                          ),
                        ),
                        Text(
                          containerCruisersRecord.length.toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Comfortaa',
                                    fontSize: 12.0,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              1.0, 0.0, 2.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'zxig6tjg' /* m */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Comfortaa',
                                  fontSize: 12.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
