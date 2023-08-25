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
import 'view_cruiser_pricelist_model.dart';
export 'view_cruiser_pricelist_model.dart';

class ViewCruiserPricelistWidget extends StatefulWidget {
  const ViewCruiserPricelistWidget({
    Key? key,
    this.cruiserRef,
  }) : super(key: key);

  final DocumentReference? cruiserRef;

  @override
  _ViewCruiserPricelistWidgetState createState() =>
      _ViewCruiserPricelistWidgetState();
}

class _ViewCruiserPricelistWidgetState
    extends State<ViewCruiserPricelistWidget> {
  late ViewCruiserPricelistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewCruiserPricelistModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder<CruisersRecord>(
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
              width: 400.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController1 ??=
                              TextEditingController(
                            text: containerCruisersRecord.rate.toString(),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'atfxdopz' /* Daily rate */,
                            ),
                            hintText: FFLocalizations.of(context).getText(
                              'emh5q2r9' /* your daily rate in euros */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.number,
                          validator: _model.textController1Validator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: _model.skipperValue ??=
                                containerCruisersRecord.skipper.available,
                            onChanged: (newValue) async {
                              setState(() => _model.skipperValue = newValue!);
                            },
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'kujn7y0f' /* Skipper */,
                              ),
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            subtitle: Text(
                              FFLocalizations.of(context).getText(
                                'efi873ea' /* Subtitle */,
                              ),
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ),
                      if (_model.skipperValue == true)
                        TextFormField(
                          controller: _model.skipperPriceController ??=
                              TextEditingController(
                            text: containerCruisersRecord.skipper.price
                                .toString(),
                          ),
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.skipperPriceController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              '8vsduf05' /* Cost (0 for included) */,
                            ),
                            hintText: FFLocalizations.of(context).getText(
                              'klk0i9jl' /* [Some hint text...] */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            suffixIcon: _model
                                    .skipperPriceController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.skipperPriceController?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.number,
                          validator: _model.skipperPriceControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z0-9]'))
                          ],
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: _model.hostValue ??=
                                containerCruisersRecord.host.available,
                            onChanged: (newValue) async {
                              setState(() => _model.hostValue = newValue!);
                            },
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'l5ygo5sa' /* Host */,
                              ),
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            subtitle: Text(
                              FFLocalizations.of(context).getText(
                                'bfcucxdp' /* Subtitle */,
                              ),
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ),
                      if (_model.hostValue ?? true)
                        TextFormField(
                          controller: _model.hostPriceController ??=
                              TextEditingController(
                            text: containerCruisersRecord.host.price.toString(),
                          ),
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.hostPriceController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'u137de6b' /* Cost (0 for included) */,
                            ),
                            hintText: FFLocalizations.of(context).getText(
                              'acpkrmxh' /* [Some hint text...] */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            suffixIcon:
                                _model.hostPriceController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.hostPriceController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22.0,
                                        ),
                                      )
                                    : null,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.number,
                          validator: _model.hostPriceControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z0-9]'))
                          ],
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: _model.cateringValue ??=
                                containerCruisersRecord.catering.available,
                            onChanged: (newValue) async {
                              setState(() => _model.cateringValue = newValue!);
                            },
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'k7o6q0b7' /* Catering */,
                              ),
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            subtitle: Text(
                              FFLocalizations.of(context).getText(
                                'qxvcg9c8' /* Subtitle */,
                              ),
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ),
                      if (_model.cateringValue ?? true)
                        TextFormField(
                          controller: _model.cateringPriceController ??=
                              TextEditingController(
                            text: containerCruisersRecord.catering.price
                                .toString(),
                          ),
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.cateringPriceController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'd1swg09y' /* Cost (0 for included) */,
                            ),
                            hintText: FFLocalizations.of(context).getText(
                              'yg8b9cag' /* [Some hint text...] */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            suffixIcon: _model
                                    .cateringPriceController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.cateringPriceController?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.number,
                          validator: _model.cateringPriceControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z0-9]'))
                          ],
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await widget.cruiserRef!
                                .update(createCruisersRecordData(
                              rate:
                                  double.tryParse(_model.textController1.text),
                              skipper: createServiceStruct(
                                available: _model.skipperValue,
                                price: double.tryParse(
                                    _model.skipperPriceController.text),
                                clearUnsetFields: false,
                              ),
                              host: createServiceStruct(
                                available: _model.hostValue,
                                price: double.tryParse(
                                    _model.hostPriceController.text),
                                clearUnsetFields: false,
                              ),
                              catering: createServiceStruct(
                                available: _model.cateringValue,
                                price: double.tryParse(
                                    _model.cateringPriceController.text),
                                clearUnsetFields: false,
                              ),
                            ));
                          },
                          text: FFLocalizations.of(context).getText(
                            '6gcu6gqb' /* Update */,
                          ),
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Comfortaa',
                                  color: Colors.white,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
