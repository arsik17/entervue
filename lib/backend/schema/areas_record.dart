import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AreasRecord extends FirestoreRecord {
  AreasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "area_name" field.
  String? _areaName;
  String get areaName => _areaName ?? '';
  bool hasAreaName() => _areaName != null;

  // "area_code" field.
  String? _areaCode;
  String get areaCode => _areaCode ?? '';
  bool hasAreaCode() => _areaCode != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _areaName = snapshotData['area_name'] as String?;
    _areaCode = snapshotData['area_code'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('areas');

  static Stream<AreasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AreasRecord.fromSnapshot(s));

  static Future<AreasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AreasRecord.fromSnapshot(s));

  static AreasRecord fromSnapshot(DocumentSnapshot snapshot) => AreasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AreasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AreasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AreasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AreasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAreasRecordData({
  String? areaName,
  String? areaCode,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'area_name': areaName,
      'area_code': areaCode,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class AreasRecordDocumentEquality implements Equality<AreasRecord> {
  const AreasRecordDocumentEquality();

  @override
  bool equals(AreasRecord? e1, AreasRecord? e2) {
    return e1?.areaName == e2?.areaName &&
        e1?.areaCode == e2?.areaCode &&
        e1?.description == e2?.description;
  }

  @override
  int hash(AreasRecord? e) =>
      const ListEquality().hash([e?.areaName, e?.areaCode, e?.description]);

  @override
  bool isValidKey(Object? o) => o is AreasRecord;
}
