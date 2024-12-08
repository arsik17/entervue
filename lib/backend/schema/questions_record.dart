import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsRecord extends FirestoreRecord {
  QuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "answers" field.
  List<String>? _answers;
  List<String> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  // "correct_answer" field.
  String? _correctAnswer;
  String get correctAnswer => _correctAnswer ?? '';
  bool hasCorrectAnswer() => _correctAnswer != null;

  // "difficulty" field.
  String? _difficulty;
  String get difficulty => _difficulty ?? '';
  bool hasDifficulty() => _difficulty != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "area" field.
  DocumentReference? _area;
  DocumentReference? get area => _area;
  bool hasArea() => _area != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _answers = getDataList(snapshotData['answers']);
    _correctAnswer = snapshotData['correct_answer'] as String?;
    _difficulty = snapshotData['difficulty'] as String?;
    _type = snapshotData['type'] as String?;
    _tags = getDataList(snapshotData['tags']);
    _area = snapshotData['area'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('questions');

  static Stream<QuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionsRecord.fromSnapshot(s));

  static Future<QuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionsRecord.fromSnapshot(s));

  static QuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionsRecordData({
  String? question,
  String? correctAnswer,
  String? difficulty,
  String? type,
  DocumentReference? area,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'correct_answer': correctAnswer,
      'difficulty': difficulty,
      'type': type,
      'area': area,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionsRecordDocumentEquality implements Equality<QuestionsRecord> {
  const QuestionsRecordDocumentEquality();

  @override
  bool equals(QuestionsRecord? e1, QuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.question == e2?.question &&
        listEquality.equals(e1?.answers, e2?.answers) &&
        e1?.correctAnswer == e2?.correctAnswer &&
        e1?.difficulty == e2?.difficulty &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.area == e2?.area;
  }

  @override
  int hash(QuestionsRecord? e) => const ListEquality().hash([
        e?.question,
        e?.answers,
        e?.correctAnswer,
        e?.difficulty,
        e?.type,
        e?.tags,
        e?.area
      ]);

  @override
  bool isValidKey(Object? o) => o is QuestionsRecord;
}
