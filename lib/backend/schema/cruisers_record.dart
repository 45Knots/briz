import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CruisersRecord extends FirestoreRecord {
  CruisersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cabins" field.
  int? _cabins;
  int get cabins => _cabins ?? 0;
  bool hasCabins() => _cabins != null;

  // "capacity" field.
  int? _capacity;
  int get capacity => _capacity ?? 0;
  bool hasCapacity() => _capacity != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "imageFolder" field.
  String? _imageFolder;
  String get imageFolder => _imageFolder ?? '';
  bool hasImageFolder() => _imageFolder != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  bool hasModel() => _model != null;

  // "length" field.
  double? _length;
  double get length => _length ?? 0.0;
  bool hasLength() => _length != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  bool hasRate() => _rate != null;

  // "catering" field.
  ServiceStruct? _catering;
  ServiceStruct get catering => _catering ?? ServiceStruct();
  bool hasCatering() => _catering != null;

  // "skipper" field.
  ServiceStruct? _skipper;
  ServiceStruct get skipper => _skipper ?? ServiceStruct();
  bool hasSkipper() => _skipper != null;

  // "host" field.
  ServiceStruct? _host;
  ServiceStruct get host => _host ?? ServiceStruct();
  bool hasHost() => _host != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "is_temp" field.
  bool? _isTemp;
  bool get isTemp => _isTemp ?? false;
  bool hasIsTemp() => _isTemp != null;

  void _initializeFields() {
    _cabins = castToType<int>(snapshotData['cabins']);
    _capacity = castToType<int>(snapshotData['capacity']);
    _title = snapshotData['title'] as String?;
    _type = snapshotData['type'] as String?;
    _description = snapshotData['description'] as String?;
    _imageFolder = snapshotData['imageFolder'] as String?;
    _image = snapshotData['image'] as String?;
    _images = getDataList(snapshotData['images']);
    _model = snapshotData['model'] as String?;
    _length = castToType<double>(snapshotData['length']);
    _location = snapshotData['location'] as LatLng?;
    _rate = castToType<double>(snapshotData['rate']);
    _catering = ServiceStruct.maybeFromMap(snapshotData['catering']);
    _skipper = ServiceStruct.maybeFromMap(snapshotData['skipper']);
    _host = ServiceStruct.maybeFromMap(snapshotData['host']);
    _owner = snapshotData['owner'] as DocumentReference?;
    _isTemp = snapshotData['is_temp'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cruisers');

  static Stream<CruisersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CruisersRecord.fromSnapshot(s));

  static Future<CruisersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CruisersRecord.fromSnapshot(s));

  static CruisersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CruisersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CruisersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CruisersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CruisersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CruisersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCruisersRecordData({
  int? cabins,
  int? capacity,
  String? title,
  String? type,
  String? description,
  String? imageFolder,
  String? image,
  String? model,
  double? length,
  LatLng? location,
  double? rate,
  ServiceStruct? catering,
  ServiceStruct? skipper,
  ServiceStruct? host,
  DocumentReference? owner,
  bool? isTemp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cabins': cabins,
      'capacity': capacity,
      'title': title,
      'type': type,
      'description': description,
      'imageFolder': imageFolder,
      'image': image,
      'model': model,
      'length': length,
      'location': location,
      'rate': rate,
      'catering': ServiceStruct().toMap(),
      'skipper': ServiceStruct().toMap(),
      'host': ServiceStruct().toMap(),
      'owner': owner,
      'is_temp': isTemp,
    }.withoutNulls,
  );

  // Handle nested data for "catering" field.
  addServiceStructData(firestoreData, catering, 'catering');

  // Handle nested data for "skipper" field.
  addServiceStructData(firestoreData, skipper, 'skipper');

  // Handle nested data for "host" field.
  addServiceStructData(firestoreData, host, 'host');

  return firestoreData;
}

class CruisersRecordDocumentEquality implements Equality<CruisersRecord> {
  const CruisersRecordDocumentEquality();

  @override
  bool equals(CruisersRecord? e1, CruisersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.cabins == e2?.cabins &&
        e1?.capacity == e2?.capacity &&
        e1?.title == e2?.title &&
        e1?.type == e2?.type &&
        e1?.description == e2?.description &&
        e1?.imageFolder == e2?.imageFolder &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.model == e2?.model &&
        e1?.length == e2?.length &&
        e1?.location == e2?.location &&
        e1?.rate == e2?.rate &&
        e1?.catering == e2?.catering &&
        e1?.skipper == e2?.skipper &&
        e1?.host == e2?.host &&
        e1?.owner == e2?.owner &&
        e1?.isTemp == e2?.isTemp;
  }

  @override
  int hash(CruisersRecord? e) => const ListEquality().hash([
        e?.cabins,
        e?.capacity,
        e?.title,
        e?.type,
        e?.description,
        e?.imageFolder,
        e?.image,
        e?.images,
        e?.model,
        e?.length,
        e?.location,
        e?.rate,
        e?.catering,
        e?.skipper,
        e?.host,
        e?.owner,
        e?.isTemp
      ]);

  @override
  bool isValidKey(Object? o) => o is CruisersRecord;
}
