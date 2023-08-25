// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DarkModeSettingsStruct extends FFFirebaseStruct {
  DarkModeSettingsStruct({
    bool? useSystem,
    bool? isDarkmode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _useSystem = useSystem,
        _isDarkmode = isDarkmode,
        super(firestoreUtilData);

  // "use_system" field.
  bool? _useSystem;
  bool get useSystem => _useSystem ?? false;
  set useSystem(bool? val) => _useSystem = val;
  bool hasUseSystem() => _useSystem != null;

  // "is_darkmode" field.
  bool? _isDarkmode;
  bool get isDarkmode => _isDarkmode ?? false;
  set isDarkmode(bool? val) => _isDarkmode = val;
  bool hasIsDarkmode() => _isDarkmode != null;

  static DarkModeSettingsStruct fromMap(Map<String, dynamic> data) =>
      DarkModeSettingsStruct(
        useSystem: data['use_system'] as bool?,
        isDarkmode: data['is_darkmode'] as bool?,
      );

  static DarkModeSettingsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? DarkModeSettingsStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'use_system': _useSystem,
        'is_darkmode': _isDarkmode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'use_system': serializeParam(
          _useSystem,
          ParamType.bool,
        ),
        'is_darkmode': serializeParam(
          _isDarkmode,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DarkModeSettingsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DarkModeSettingsStruct(
        useSystem: deserializeParam(
          data['use_system'],
          ParamType.bool,
          false,
        ),
        isDarkmode: deserializeParam(
          data['is_darkmode'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DarkModeSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DarkModeSettingsStruct &&
        useSystem == other.useSystem &&
        isDarkmode == other.isDarkmode;
  }

  @override
  int get hashCode => const ListEquality().hash([useSystem, isDarkmode]);
}

DarkModeSettingsStruct createDarkModeSettingsStruct({
  bool? useSystem,
  bool? isDarkmode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DarkModeSettingsStruct(
      useSystem: useSystem,
      isDarkmode: isDarkmode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DarkModeSettingsStruct? updateDarkModeSettingsStruct(
  DarkModeSettingsStruct? darkModeSettings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    darkModeSettings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDarkModeSettingsStructData(
  Map<String, dynamic> firestoreData,
  DarkModeSettingsStruct? darkModeSettings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (darkModeSettings == null) {
    return;
  }
  if (darkModeSettings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && darkModeSettings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final darkModeSettingsData =
      getDarkModeSettingsFirestoreData(darkModeSettings, forFieldValue);
  final nestedData =
      darkModeSettingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = darkModeSettings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDarkModeSettingsFirestoreData(
  DarkModeSettingsStruct? darkModeSettings, [
  bool forFieldValue = false,
]) {
  if (darkModeSettings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(darkModeSettings.toMap());

  // Add any Firestore field values
  darkModeSettings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDarkModeSettingsListFirestoreData(
  List<DarkModeSettingsStruct>? darkModeSettingss,
) =>
    darkModeSettingss
        ?.map((e) => getDarkModeSettingsFirestoreData(e, true))
        .toList() ??
    [];
