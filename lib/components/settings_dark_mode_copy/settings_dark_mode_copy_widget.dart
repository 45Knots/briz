import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_dark_mode_copy_model.dart';
export 'settings_dark_mode_copy_model.dart';

class SettingsDarkModeCopyWidget extends StatefulWidget {
  const SettingsDarkModeCopyWidget({Key? key}) : super(key: key);

  @override
  _SettingsDarkModeCopyWidgetState createState() =>
      _SettingsDarkModeCopyWidgetState();
}

class _SettingsDarkModeCopyWidgetState
    extends State<SettingsDarkModeCopyWidget> {
  late SettingsDarkModeCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsDarkModeCopyModel());

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'asuezggh' /* Communications */,
              ),
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).headlineSmall,
            ),
          ),
        ),
        FlutterFlowDropDown<String>(
          controller: _model.dropDownValueController ??=
              FormFieldController<String>(null),
          options: [
            FFLocalizations.of(context).getText(
              '2cjlev3s' /* Whatsapp */,
            ),
            FFLocalizations.of(context).getText(
              'ttp8ucar' /* Viber */,
            ),
            FFLocalizations.of(context).getText(
              '8tzodetd' /* SMS */,
            )
          ],
          onChanged: (val) => setState(() => _model.dropDownValue = val),
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 50.0,
          textStyle: FlutterFlowTheme.of(context).bodyMedium,
          hintText: FFLocalizations.of(context).getText(
            'r5i0yec9' /* Please select... */,
          ),
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          elevation: 2.0,
          borderColor: Colors.transparent,
          borderWidth: 0.0,
          borderRadius: 0.0,
          margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
          hidesUnderline: true,
          isSearchable: false,
          isMultiSelect: false,
        ),
      ],
    );
  }
}
