import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'multiple_choice_template_widget.dart' show MultipleChoiceTemplateWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MultipleChoiceTemplateModel
    extends FlutterFlowModel<MultipleChoiceTemplateWidget> {
  ///  Local state fields for this component.

  String? answer;

  bool check = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in multipleChoiceTemplate widget.
  AnswersRecord? useranswer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
