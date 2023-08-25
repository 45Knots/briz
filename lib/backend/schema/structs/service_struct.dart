// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceStruct extends FFFirebaseStruct {
  ServiceStruct({
    String? name,
    bool? available,
    double? price,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _available = available,
        _price = price,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "available" field.
  bool? _available;
  bool get available => _available ?? false;
  set available(bool? val) => _available = val;
  bool hasAvailable() => _available != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  static ServiceStruct fromMap(Map<String, dynamic> data) => ServiceStruct(
        name: data['name'] as String?,
        available: data['available'] as bool?,
        price: castToType<double>(data['price']),
      );

  static ServiceStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ServiceStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'available': _available,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'available': serializeParam(
          _available,
          ParamType.bool,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
      }.withoutNulls;

  static ServiceStruct fromSerializableMap(Map<String, dynamic> data) =>
      ServiceStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        available: deserializeParam(
          data['available'],
          ParamType.bool,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ServiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServiceStruct &&
        name == other.name &&
        available == other.available &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality().hash([name, available, price]);
}

ServiceStruct createServiceStruct({
  String? name,
  bool? available,
  double? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ServiceStruct(
      name: name,
      available: available,
      price: price,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ServiceStruct? updateServiceStruct(
  ServiceStruct? service, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    service
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addServiceStructData(
  Map<String, dynamic> firestoreData,
  ServiceStruct? service,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (service == null) {
    return;
  }
  if (service.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && service.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final serviceData = getServiceFirestoreData(service, forFieldValue);
  final nestedData = serviceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = service.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getServiceFirestoreData(
  ServiceStruct? service, [
  bool forFieldValue = false,
]) {
  if (service == null) {
    return {};
  }
  final firestoreData = mapToFirestore(service.toMap());

  // Add any Firestore field values
  service.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getServiceListFirestoreData(
  List<ServiceStruct>? services,
) =>
    services?.map((e) => getServiceFirestoreData(e, true)).toList() ?? [];
