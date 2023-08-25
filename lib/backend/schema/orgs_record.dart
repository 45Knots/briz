import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrgsRecord extends FirestoreRecord {
  OrgsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orgs');

  static Stream<OrgsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrgsRecord.fromSnapshot(s));

  static Future<OrgsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrgsRecord.fromSnapshot(s));

  static OrgsRecord fromSnapshot(DocumentSnapshot snapshot) => OrgsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrgsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrgsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrgsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrgsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrgsRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrgsRecordDocumentEquality implements Equality<OrgsRecord> {
  const OrgsRecordDocumentEquality();

  @override
  bool equals(OrgsRecord? e1, OrgsRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(OrgsRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is OrgsRecord;
}
