import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswersRecord extends FirestoreRecord {
  AnswersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question_ref" field.
  DocumentReference? _questionRef;
  DocumentReference? get questionRef => _questionRef;
  bool hasQuestionRef() => _questionRef != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "is_correct" field.
  bool? _isCorrect;
  bool get isCorrect => _isCorrect ?? false;
  bool hasIsCorrect() => _isCorrect != null;

  // "area_ref" field.
  DocumentReference? _areaRef;
  DocumentReference? get areaRef => _areaRef;
  bool hasAreaRef() => _areaRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _questionRef = snapshotData['question_ref'] as DocumentReference?;
    _answer = snapshotData['answer'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _isCorrect = snapshotData['is_correct'] as bool?;
    _areaRef = snapshotData['area_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('answers')
          : FirebaseFirestore.instance.collectionGroup('answers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('answers').doc(id);

  static Stream<AnswersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnswersRecord.fromSnapshot(s));

  static Future<AnswersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnswersRecord.fromSnapshot(s));

  static AnswersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnswersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnswersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnswersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnswersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnswersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnswersRecordData({
  DocumentReference? questionRef,
  String? answer,
  DateTime? timestamp,
  bool? isCorrect,
  DocumentReference? areaRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question_ref': questionRef,
      'answer': answer,
      'timestamp': timestamp,
      'is_correct': isCorrect,
      'area_ref': areaRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnswersRecordDocumentEquality implements Equality<AnswersRecord> {
  const AnswersRecordDocumentEquality();

  @override
  bool equals(AnswersRecord? e1, AnswersRecord? e2) {
    return e1?.questionRef == e2?.questionRef &&
        e1?.answer == e2?.answer &&
        e1?.timestamp == e2?.timestamp &&
        e1?.isCorrect == e2?.isCorrect &&
        e1?.areaRef == e2?.areaRef;
  }

  @override
  int hash(AnswersRecord? e) => const ListEquality().hash(
      [e?.questionRef, e?.answer, e?.timestamp, e?.isCorrect, e?.areaRef]);

  @override
  bool isValidKey(Object? o) => o is AnswersRecord;
}
