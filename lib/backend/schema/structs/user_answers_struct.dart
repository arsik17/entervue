// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAnswersStruct extends FFFirebaseStruct {
  UserAnswersStruct({
    DocumentReference? questionRef,
    String? userAnswer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _questionRef = questionRef,
        _userAnswer = userAnswer,
        super(firestoreUtilData);

  // "questionRef" field.
  DocumentReference? _questionRef;
  DocumentReference? get questionRef => _questionRef;
  set questionRef(DocumentReference? val) => _questionRef = val;

  bool hasQuestionRef() => _questionRef != null;

  // "user_answer" field.
  String? _userAnswer;
  String get userAnswer => _userAnswer ?? '';
  set userAnswer(String? val) => _userAnswer = val;

  bool hasUserAnswer() => _userAnswer != null;

  static UserAnswersStruct fromMap(Map<String, dynamic> data) =>
      UserAnswersStruct(
        questionRef: data['questionRef'] as DocumentReference?,
        userAnswer: data['user_answer'] as String?,
      );

  static UserAnswersStruct? maybeFromMap(dynamic data) => data is Map
      ? UserAnswersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'questionRef': _questionRef,
        'user_answer': _userAnswer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'questionRef': serializeParam(
          _questionRef,
          ParamType.DocumentReference,
        ),
        'user_answer': serializeParam(
          _userAnswer,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserAnswersStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserAnswersStruct(
        questionRef: deserializeParam(
          data['questionRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['questions'],
        ),
        userAnswer: deserializeParam(
          data['user_answer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserAnswersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserAnswersStruct &&
        questionRef == other.questionRef &&
        userAnswer == other.userAnswer;
  }

  @override
  int get hashCode => const ListEquality().hash([questionRef, userAnswer]);
}

UserAnswersStruct createUserAnswersStruct({
  DocumentReference? questionRef,
  String? userAnswer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserAnswersStruct(
      questionRef: questionRef,
      userAnswer: userAnswer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserAnswersStruct? updateUserAnswersStruct(
  UserAnswersStruct? userAnswers, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userAnswers
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserAnswersStructData(
  Map<String, dynamic> firestoreData,
  UserAnswersStruct? userAnswers,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userAnswers == null) {
    return;
  }
  if (userAnswers.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userAnswers.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userAnswersData =
      getUserAnswersFirestoreData(userAnswers, forFieldValue);
  final nestedData =
      userAnswersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userAnswers.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserAnswersFirestoreData(
  UserAnswersStruct? userAnswers, [
  bool forFieldValue = false,
]) {
  if (userAnswers == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userAnswers.toMap());

  // Add any Firestore field values
  userAnswers.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserAnswersListFirestoreData(
  List<UserAnswersStruct>? userAnswerss,
) =>
    userAnswerss?.map((e) => getUserAnswersFirestoreData(e, true)).toList() ??
    [];
