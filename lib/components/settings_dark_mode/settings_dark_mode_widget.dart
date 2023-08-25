import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_dark_mode_model.dart';
export 'settings_dark_mode_model.dart';

class SettingsDarkModeWidget extends StatefulWidget {
  const SettingsDarkModeWidget({Key? key}) : super(key: key);

  @override
  _SettingsDarkModeWidgetState createState() => _SettingsDarkModeWidgetState();
}

class _SettingsDarkModeWidgetState extends State<SettingsDarkModeWidget> {
  late SettingsDarkModeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsDarkModeModel());

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
                '6lslxbib' /* Dark Mode */,
              ),
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).headlineSmall,
            ),
          ),
        ),
        AuthUserStreamWidget(
          builder: (context) => SwitchListTile.adaptive(
            value: _model.useSystemDarkModeValue ??=
                currentUserDocument!.preferences.darkmode.useSystem,
            onChanged: (newValue) async {
              setState(() => _model.useSystemDarkModeValue = newValue!);
              if (newValue!) {
                await currentUserReference!.update(createUsersRecordData(
                  preferences: createPreferencesStruct(
                    darkmode: createDarkModeSettingsStruct(
                      useSystem: true,
                      clearUnsetFields: false,
                    ),
                    clearUnsetFields: false,
                  ),
                ));
                setDarkModeSetting(context, ThemeMode.system);
              } else {
                await currentUserReference!.update(createUsersRecordData(
                  preferences: createPreferencesStruct(
                    darkmode: createDarkModeSettingsStruct(
                      useSystem: false,
                      clearUnsetFields: false,
                    ),
                    clearUnsetFields: false,
                  ),
                ));
                if (currentUserDocument!.preferences.darkmode.isDarkmode) {
                  setDarkModeSetting(context, ThemeMode.dark);
                } else {
                  setDarkModeSetting(context, ThemeMode.light);
                }
              }
            },
            title: Text(
              FFLocalizations.of(context).getText(
                'qmivaic0' /* Use system setting */,
              ),
              style: FlutterFlowTheme.of(context).bodySmall,
            ),
            tileColor: Color(0xFFF5F5F5),
            activeColor: FlutterFlowTheme.of(context).primary,
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        ),
        if (!_model.useSystemDarkModeValue!)
          AuthUserStreamWidget(
            builder: (context) => SwitchListTile.adaptive(
              value: _model.isDarkModeValue ??=
                  currentUserDocument!.preferences.darkmode.isDarkmode,
              onChanged: (newValue) async {
                setState(() => _model.isDarkModeValue = newValue!);
                if (newValue!) {
                  await currentUserReference!.update(createUsersRecordData(
                    preferences: createPreferencesStruct(
                      darkmode: createDarkModeSettingsStruct(
                        isDarkmode: true,
                        clearUnsetFields: false,
                      ),
                      clearUnsetFields: false,
                    ),
                  ));
                  if (currentUserDocument!.preferences.darkmode.useSystem) {
                    return;
                  }

                  setDarkModeSetting(context, ThemeMode.dark);
                } else {
                  await currentUserReference!.update(createUsersRecordData(
                    preferences: createPreferencesStruct(
                      darkmode: createDarkModeSettingsStruct(
                        isDarkmode: false,
                        clearUnsetFields: false,
                      ),
                      clearUnsetFields: false,
                    ),
                  ));
                  if (currentUserDocument!.preferences.darkmode.useSystem) {
                    return;
                  }

                  setDarkModeSetting(context, ThemeMode.light);
                }
              },
              title: Text(
                FFLocalizations.of(context).getText(
                  'zvbmmogc' /* Enable dark mode */,
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
              ),
              tileColor: Color(0xFFF5F5F5),
              activeColor: FlutterFlowTheme.of(context).primary,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          ),
      ],
    );
  }
}
