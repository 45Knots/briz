import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_cruiser_details_model.dart';
export 'view_cruiser_details_model.dart';

class ViewCruiserDetailsWidget extends StatefulWidget {
  const ViewCruiserDetailsWidget({
    Key? key,
    this.cruiserRef,
  }) : super(key: key);

  final DocumentReference? cruiserRef;

  @override
  _ViewCruiserDetailsWidgetState createState() =>
      _ViewCruiserDetailsWidgetState();
}

class _ViewCruiserDetailsWidgetState extends State<ViewCruiserDetailsWidget> {
  late ViewCruiserDetailsModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewCruiserDetailsModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
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
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 20.0,
                                decoration: BoxDecoration(),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.typeValueController ??=
                                      FormFieldController<String>(
                                    _model.typeValue ??=
                                        containerCruisersRecord.type,
                                  ),
                                  options: [
                                    FFLocalizations.of(context).getText(
                                      'esy1x743' /* Sailing Boat */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'gpko7h9q' /* Cruiser */,
                                    )
                                  ],
                                  onChanged: (val) =>
                                      setState(() => _model.typeValue = val),
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Comfortaa',
                                        color: Colors.black,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '4flqkenk' /* Select the boat type */,
                                  ),
                                  fillColor: Colors.white,
                                  elevation: 2.0,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  borderWidth: 0.0,
                                  borderRadius: 10.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 4.0, 12.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: TextFormField(
                                  controller: _model.titleController ??=
                                      TextEditingController(
                                    text: containerCruisersRecord.title,
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'iskmfrqc' /* Name */,
                                    ),
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'ye266uh2' /* What's the name of the boat */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Comfortaa',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.titleControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: TextFormField(
                                  controller: _model.modelController ??=
                                      TextEditingController(
                                    text: containerCruisersRecord.model,
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'sscz2jfl' /* Model */,
                                    ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'af2ne5yp' /* [Some hint text...] */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.modelControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'lm4961ly' /* Cabins */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: 160.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: FlutterFlowCountController(
                                            decrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.minus,
                                              color: enabled
                                                  ? Color(0xDD000000)
                                                  : Color(0xFFEEEEEE),
                                              size: 20.0,
                                            ),
                                            incrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.plus,
                                              color: enabled
                                                  ? Colors.blue
                                                  : Color(0xFFEEEEEE),
                                              size: 20.0,
                                            ),
                                            countBuilder: (count) => Text(
                                              count.toString(),
                                              style: GoogleFonts.getFont(
                                                'Roboto',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            count: _model.cabinsValue ??=
                                                containerCruisersRecord.cabins,
                                            updateCount: (count) => setState(
                                                () =>
                                                    _model.cabinsValue = count),
                                            stepSize: 1,
                                            minimum: 1,
                                            maximum: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'fce0r0ru' /* Capacity */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: 160.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: FlutterFlowCountController(
                                            decrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.minus,
                                              color: enabled
                                                  ? Color(0xDD000000)
                                                  : Color(0xFFEEEEEE),
                                              size: 20.0,
                                            ),
                                            incrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.plus,
                                              color: enabled
                                                  ? Colors.blue
                                                  : Color(0xFFEEEEEE),
                                              size: 20.0,
                                            ),
                                            countBuilder: (count) => Text(
                                              count.toString(),
                                              style: GoogleFonts.getFont(
                                                'Roboto',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            count: _model.capacityValue ??=
                                                containerCruisersRecord
                                                    .capacity,
                                            updateCount: (count) => setState(
                                                () => _model.capacityValue =
                                                    count),
                                            stepSize: 1,
                                            minimum: 2,
                                            maximum: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'j6ryzumu' /* Length */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Expanded(
                                      child: Slider(
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveColor: Color(0xFF9E9E9E),
                                        min: 5.0,
                                        max: 20.0,
                                        value: _model.lengthValue ??=
                                            containerCruisersRecord.length,
                                        label: _model.lengthValue.toString(),
                                        divisions: 30,
                                        onChanged: (newValue) {
                                          setState(() =>
                                              _model.lengthValue = newValue);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: TextFormField(
                                  controller: _model.descriptionController ??=
                                      TextEditingController(
                                    text: containerCruisersRecord.description,
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '2qaob2n5' /* Description */,
                                    ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'fe1gh6tw' /* [Some hint text...] */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  validator: _model
                                      .descriptionControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              FlutterFlowPlacePicker(
                                iOSGoogleMapsApiKey:
                                    'AIzaSyBBo9nmvQWqI_aokt1ECxtXwntCDLtJmfQ',
                                androidGoogleMapsApiKey:
                                    'AIzaSyCm70-KZxWVEgFeYVUd4UBTC_eOzB0V9PU',
                                webGoogleMapsApiKey:
                                    'AIzaSyC9yt8nOe1DASRHJQ-h0RrhEpZ8a3Ym7_s',
                                onSelect: (place) async {
                                  setState(
                                      () => _model.placePickerValue = place);
                                  (await _model.googleMapsController.future)
                                      .animateCamera(CameraUpdate.newLatLng(
                                          place.latLng.toGoogleMaps()));
                                },
                                defaultText:
                                    FFLocalizations.of(context).getText(
                                  '1jclamyj' /* Select Location */,
                                ),
                                icon: Icon(
                                  Icons.place,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                                buttonOptions: FFButtonOptions(
                                  width: 200.0,
                                  height: 40.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Comfortaa',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  height: 400.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Builder(builder: (context) {
                                      final _googleMapMarker =
                                          _model.placePickerValue.latLng;
                                      return FlutterFlowGoogleMap(
                                        controller: _model.googleMapsController,
                                        onCameraIdle: (latLng) =>
                                            _model.googleMapsCenter = latLng,
                                        initialLocation: _model
                                                .googleMapsCenter ??=
                                            containerCruisersRecord.location !=
                                                    null
                                                ? containerCruisersRecord
                                                    .location!
                                                : currentUserLocationValue!,
                                        markers: [
                                          if (_googleMapMarker != null)
                                            FlutterFlowMarker(
                                              _googleMapMarker.serialize(),
                                              _googleMapMarker,
                                            ),
                                        ],
                                        markerColor: GoogleMarkerColor.violet,
                                        mapType: MapType.hybrid,
                                        style: GoogleMapStyle.standard,
                                        initialZoom: 14.0,
                                        allowInteraction: true,
                                        allowZoom: true,
                                        showZoomControls: true,
                                        showLocation: true,
                                        showCompass: true,
                                        showMapToolbar: false,
                                        showTraffic: false,
                                        centerMapOnMarkerTap: true,
                                      );
                                    }),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 20.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await widget.cruiserRef!
                                        .update(createCruisersRecordData(
                                      cabins: _model.cabinsValue,
                                      capacity: _model.capacityValue,
                                      title: _model.titleController.text,
                                      description:
                                          _model.descriptionController.text,
                                      model: _model.modelController.text,
                                      length: _model.lengthValue,
                                      type: _model.typeValue,
                                      isTemp: false,
                                      location: _model.googleMapsCenter,
                                    ));
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'dk4wjelt' /* Update */,
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
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
