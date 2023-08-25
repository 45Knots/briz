// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PreferencesStruct extends FFFirebaseStruct {
  PreferencesStruct({
    DarkModeSettingsStruct? darkmode,
    bool? whatsapp,
    bool? viber,
    bool? sms,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _darkmode = darkmode,
        _whatsapp = whatsapp,
        _viber = viber,
        _sms = sms,
        super(firestoreUtilData);

  // "darkmode" field.
  DarkModeSettingsStruct? _darkmode;
  DarkModeSettingsStruct get darkmode => _darkmode ?? DarkModeSettingsStruct();
  set darkmode(DarkModeSettingsStruct? val) => _darkmode = val;
  void updateDarkmode(Function(DarkModeSettingsStruct) updateFn) =>
      updateFn(_darkmode ??= DarkModeSettingsStruct());
  bool hasDarkmode() => _darkmode != null;

  // "whatsapp" field.
  bool? _whatsapp;
  bool get whatsapp => _whatsapp ?? false;
  set whatsapp(bool? val) => _whatsapp = val;
  bool hasWhatsapp() => _whatsapp != null;

  // "viber" field.
  bool? _viber;
  bool get viber => _viber ?? false;
  set viber(bool? val) => _viber = val;
  bool hasViber() => _viber != null;

  // "sms" field.
  bool? _sms;
  bool get sms => _sms ?? false;
  set sms(bool? val) => _sms = val;
  bool hasSms() => _sms != null;

  static PreferencesStruct fromMap(Map<String, dynamic> data) =>
      PreferencesStruct(
        darkmode: DarkModeSettingsStruct.maybeFromMap(data['darkmode']),
        whatsapp: data['whatsapp'] as bool?,
        viber: data['viber'] as bool?,
        sms: data['sms'] as bool?,
      );

  static PreferencesStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PreferencesStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'darkmode': _darkmode?.toMap(),
        'whatsapp': _whatsapp,
        'viber': _viber,
        'sms': _sms,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'darkmode': serializeParam(
          _darkmode,
          ParamType.DataStruct,
        ),
        'whatsapp': serializeParam(
          _whatsapp,
          ParamType.bool,
        ),
        'viber': serializeParam(
          _viber,
          ParamType.bool,
        ),
        'sms': serializeParam(
          _sms,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PreferencesStruct fromSerializableMap(Map<String, dynamic> data) =>
      PreferencesStruct(
        darkmode: deserializeStructParam(
          data['darkmode'],
          ParamType.DataStruct,
          false,
          structBuilder: DarkModeSettingsStruct.fromSerializableMap,
        ),
        whatsapp: deserializeParam(
          data['whatsapp'],
          ParamType.bool,
          false,
        ),
        viber: deserializeParam(
          data['viber'],
          ParamType.bool,
          false,
        ),
        sms: deserializeParam(
          data['sms'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'PreferencesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PreferencesStruct &&
        darkmode == other.darkmode &&
        whatsapp == other.whatsapp &&
        viber == other.viber &&
        sms == other.sms;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([darkmode, whatsapp, viber, sms]);
}

PreferencesStruct createPreferencesStruct({
  DarkModeSettingsStruct? darkmode,
  bool? whatsapp,
  bool? viber,
  bool? sms,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PreferencesStruct(
      darkmode:
          darkmode ?? (clearUnsetFields ? DarkModeSettingsStruct() : null),
      whatsapp: whatsapp,
      viber: viber,
      sms: sms,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PreferencesStruct? updatePreferencesStruct(
  PreferencesStruct? preferences, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    preferences
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPreferencesStructData(
  Map<String, dynamic> firestoreData,
  PreferencesStruct? preferences,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (preferences == null) {
    return;
  }
  if (preferences.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && preferences.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final preferencesData =
      getPreferencesFirestoreData(preferences, forFieldValue);
  final nestedData =
      preferencesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = preferences.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPreferencesFirestoreData(
  PreferencesStruct? preferences, [
  bool forFieldValue = false,
]) {
  if (preferences == null) {
    return {};
  }
  final firestoreData = mapToFirestore(preferences.toMap());

  // Handle nested data for "darkmode" field.
  addDarkModeSettingsStructData(
    firestoreData,
    preferences.hasDarkmode() ? preferences.darkmode : null,
    'darkmode',
    forFieldValue,
  );

  // Add any Firestore field values
  preferences.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPreferencesListFirestoreData(
  List<PreferencesStruct>? preferencess,
) =>
    preferencess?.map((e) => getPreferencesFirestoreData(e, true)).toList() ??
    [];
