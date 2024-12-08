import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'fill_base_widget.dart' show FillBaseWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FillBaseModel extends FlutterFlowModel<FillBaseWidget> {
  ///  Local state fields for this page.

  List<String> answers = [];
  void addToAnswers(String item) => answers.add(item);
  void removeFromAnswers(String item) => answers.remove(item);
  void removeAtIndexFromAnswers(int index) => answers.removeAt(index);
  void insertAtIndexInAnswers(int index, String item) =>
      answers.insert(index, item);
  void updateAnswersAtIndex(int index, Function(String) updateFn) =>
      answers[index] = updateFn(answers[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for question widget.
  FocusNode? questionFocusNode;
  TextEditingController? questionTextController;
  String? Function(BuildContext, String?)? questionTextControllerValidator;
  String? _questionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for area widget.
  String? areaValue;
  FormFieldController<String>? areaValueController;
  // State field(s) for difficulty widget.
  String? difficultyValue;
  FormFieldController<String>? difficultyValueController;
  // State field(s) for answer widget.
  FocusNode? answerFocusNode;
  TextEditingController? answerTextController;
  String? Function(BuildContext, String?)? answerTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    questionTextControllerValidator = _questionTextControllerValidator;
  }

  @override
  void dispose() {
    questionFocusNode?.dispose();
    questionTextController?.dispose();

    answerFocusNode?.dispose();
    answerTextController?.dispose();
  }
}
