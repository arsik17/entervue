// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MultipleChoiceQuestionStruct extends FFFirebaseStruct {
  MultipleChoiceQuestionStruct({
    int? questionNo,
    String? question,
    List<String>? answers,
    String? correctAnswer,
    String? userAnswer,
    bool? isAnswered,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _questionNo = questionNo,
        _question = question,
        _answers = answers,
        _correctAnswer = correctAnswer,
        _userAnswer = userAnswer,
        _isAnswered = isAnswered,
        super(firestoreUtilData);

  // "question_no" field.
  int? _questionNo;
  int get questionNo => _questionNo ?? 0;
  set questionNo(int? val) => _questionNo = val;

  void incrementQuestionNo(int amount) => questionNo = questionNo + amount;

  bool hasQuestionNo() => _questionNo != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "answers" field.
  List<String>? _answers;
  List<String> get answers => _answers ?? const [];
  set answers(List<String>? val) => _answers = val;

  void updateAnswers(Function(List<String>) updateFn) {
    updateFn(_answers ??= []);
  }

  bool hasAnswers() => _answers != null;

  // "correct_answer" field.
  String? _correctAnswer;
  String get correctAnswer => _correctAnswer ?? '';
  set correctAnswer(String? val) => _correctAnswer = val;

  bool hasCorrectAnswer() => _correctAnswer != null;

  // "user_answer" field.
  String? _userAnswer;
  String get userAnswer => _userAnswer ?? '';
  set userAnswer(String? val) => _userAnswer = val;

  bool hasUserAnswer() => _userAnswer != null;

  // "is_answered" field.
  bool? _isAnswered;
  bool get isAnswered => _isAnswered ?? false;
  set isAnswered(bool? val) => _isAnswered = val;

  bool hasIsAnswered() => _isAnswered != null;

  static MultipleChoiceQuestionStruct fromMap(Map<String, dynamic> data) =>
      MultipleChoiceQuestionStruct(
        questionNo: castToType<int>(data['question_no']),
        question: data['question'] as String?,
        answers: getDataList(data['answers']),
        correctAnswer: data['correct_answer'] as String?,
        userAnswer: data['user_answer'] as String?,
        isAnswered: data['is_answered'] as bool?,
      );

  static MultipleChoiceQuestionStruct? maybeFromMap(dynamic data) => data is Map
      ? MultipleChoiceQuestionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question_no': _questionNo,
        'question': _question,
        'answers': _answers,
        'correct_answer': _correctAnswer,
        'user_answer': _userAnswer,
        'is_answered': _isAnswered,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question_no': serializeParam(
          _questionNo,
          ParamType.int,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'answers': serializeParam(
          _answers,
          ParamType.String,
          isList: true,
        ),
        'correct_answer': serializeParam(
          _correctAnswer,
          ParamType.String,
        ),
        'user_answer': serializeParam(
          _userAnswer,
          ParamType.String,
        ),
        'is_answered': serializeParam(
          _isAnswered,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MultipleChoiceQuestionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MultipleChoiceQuestionStruct(
        questionNo: deserializeParam(
          data['question_no'],
          ParamType.int,
          false,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        answers: deserializeParam<String>(
          data['answers'],
          ParamType.String,
          true,
        ),
        correctAnswer: deserializeParam(
          data['correct_answer'],
          ParamType.String,
          false,
        ),
        userAnswer: deserializeParam(
          data['user_answer'],
          ParamType.String,
          false,
        ),
        isAnswered: deserializeParam(
          data['is_answered'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'MultipleChoiceQuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MultipleChoiceQuestionStruct &&
        questionNo == other.questionNo &&
        question == other.question &&
        listEquality.equals(answers, other.answers) &&
        correctAnswer == other.correctAnswer &&
        userAnswer == other.userAnswer &&
        isAnswered == other.isAnswered;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [questionNo, question, answers, correctAnswer, userAnswer, isAnswered]);
}

MultipleChoiceQuestionStruct createMultipleChoiceQuestionStruct({
  int? questionNo,
  String? question,
  String? correctAnswer,
  String? userAnswer,
  bool? isAnswered,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MultipleChoiceQuestionStruct(
      questionNo: questionNo,
      question: question,
      correctAnswer: correctAnswer,
      userAnswer: userAnswer,
      isAnswered: isAnswered,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MultipleChoiceQuestionStruct? updateMultipleChoiceQuestionStruct(
  MultipleChoiceQuestionStruct? multipleChoiceQuestion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    multipleChoiceQuestion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMultipleChoiceQuestionStructData(
  Map<String, dynamic> firestoreData,
  MultipleChoiceQuestionStruct? multipleChoiceQuestion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (multipleChoiceQuestion == null) {
    return;
  }
  if (multipleChoiceQuestion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      multipleChoiceQuestion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final multipleChoiceQuestionData = getMultipleChoiceQuestionFirestoreData(
      multipleChoiceQuestion, forFieldValue);
  final nestedData =
      multipleChoiceQuestionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      multipleChoiceQuestion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMultipleChoiceQuestionFirestoreData(
  MultipleChoiceQuestionStruct? multipleChoiceQuestion, [
  bool forFieldValue = false,
]) {
  if (multipleChoiceQuestion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(multipleChoiceQuestion.toMap());

  // Add any Firestore field values
  multipleChoiceQuestion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMultipleChoiceQuestionListFirestoreData(
  List<MultipleChoiceQuestionStruct>? multipleChoiceQuestions,
) =>
    multipleChoiceQuestions
        ?.map((e) => getMultipleChoiceQuestionFirestoreData(e, true))
        .toList() ??
    [];
