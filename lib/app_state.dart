import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<MultipleChoiceQuestionStruct> _multipleChoiceQuestions = [
    MultipleChoiceQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question_no\":\"0\",\"question\":\"How to print \'Hello world\' in Python?\",\"answers\":\"[\\\"print(\'Hello world\')\\\",\\\"cout<<\'Hello world\';\\\",\\\"System.out.println(\'Hello wrold\');\\\",\\\"I don\'t know\\\"]\",\"correct_answer\":\"print(\'Hello world\')\",\"is_answered\":\"false\"}')),
    MultipleChoiceQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"question_no\":\"1\",\"question\":\"How arrays are indexed?\",\"answers\":\"[\\\"0-indexed\\\",\\\"1-indexed\\\",\\\"I don\'t know\\\"]\",\"correct_answer\":\"0-indexed\"}'))
  ];
  List<MultipleChoiceQuestionStruct> get multipleChoiceQuestions =>
      _multipleChoiceQuestions;
  set multipleChoiceQuestions(List<MultipleChoiceQuestionStruct> value) {
    _multipleChoiceQuestions = value;
  }

  void addToMultipleChoiceQuestions(MultipleChoiceQuestionStruct value) {
    multipleChoiceQuestions.add(value);
  }

  void removeFromMultipleChoiceQuestions(MultipleChoiceQuestionStruct value) {
    multipleChoiceQuestions.remove(value);
  }

  void removeAtIndexFromMultipleChoiceQuestions(int index) {
    multipleChoiceQuestions.removeAt(index);
  }

  void updateMultipleChoiceQuestionsAtIndex(
    int index,
    MultipleChoiceQuestionStruct Function(MultipleChoiceQuestionStruct)
        updateFn,
  ) {
    multipleChoiceQuestions[index] = updateFn(_multipleChoiceQuestions[index]);
  }

  void insertAtIndexInMultipleChoiceQuestions(
      int index, MultipleChoiceQuestionStruct value) {
    multipleChoiceQuestions.insert(index, value);
  }

  List<UserAnswersStruct> _userAnswers = [];
  List<UserAnswersStruct> get userAnswers => _userAnswers;
  set userAnswers(List<UserAnswersStruct> value) {
    _userAnswers = value;
  }

  void addToUserAnswers(UserAnswersStruct value) {
    userAnswers.add(value);
  }

  void removeFromUserAnswers(UserAnswersStruct value) {
    userAnswers.remove(value);
  }

  void removeAtIndexFromUserAnswers(int index) {
    userAnswers.removeAt(index);
  }

  void updateUserAnswersAtIndex(
    int index,
    UserAnswersStruct Function(UserAnswersStruct) updateFn,
  ) {
    userAnswers[index] = updateFn(_userAnswers[index]);
  }

  void insertAtIndexInUserAnswers(int index, UserAnswersStruct value) {
    userAnswers.insert(index, value);
  }
}
