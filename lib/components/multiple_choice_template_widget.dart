import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'multiple_choice_template_model.dart';
export 'multiple_choice_template_model.dart';

class MultipleChoiceTemplateWidget extends StatefulWidget {
  const MultipleChoiceTemplateWidget({
    super.key,
    required this.question,
    required this.index,
  });

  final QuestionsRecord? question;
  final int? index;

  @override
  State<MultipleChoiceTemplateWidget> createState() =>
      _MultipleChoiceTemplateWidgetState();
}

class _MultipleChoiceTemplateWidgetState
    extends State<MultipleChoiceTemplateWidget> {
  late MultipleChoiceTemplateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultipleChoiceTemplateModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.useranswer = await queryAnswersRecordOnce(
        parent: currentUserReference,
        queryBuilder: (answersRecord) => answersRecord.where(
          'question_ref',
          isEqualTo: widget!.question?.reference,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.useranswer != null) {
        _model.answer = _model.useranswer?.answer;
        _model.check = true;
        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question ${((widget!.index!) + 1).toString()}',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'Difficulty: ${widget!.question?.difficulty}',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
          Flexible(
            child: Text(
              widget!.question!.question,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Builder(
            builder: (context) {
              final answers = widget!.question?.answers?.toList() ?? [];

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(answers.length, (answersIndex) {
                  final answersItem = answers[answersIndex];
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (_model.check == false) {
                        _model.answer = answersItem;
                        safeSetState(() {});
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: answersItem == _model.answer
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((answersItem ==
                                    widget!.question?.correctAnswer) &&
                                (_model.check == true))
                              Icon(
                                Icons.check_rounded,
                                color: answersItem == _model.answer
                                    ? FlutterFlowTheme.of(context)
                                        .primaryBackground
                                    : FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            if ((answersItem !=
                                    widget!.question?.correctAnswer) &&
                                (_model.check == true))
                              Icon(
                                Icons.close_rounded,
                                color: FlutterFlowTheme.of(context).error,
                                size: 24.0,
                              ),
                            Flexible(
                              child: Text(
                                answersItem,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: answersItem == _model.answer
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                  );
                }).divide(SizedBox(height: 12.0)),
              );
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                _model.check = true;
                safeSetState(() {});
                FFAppState().addToUserAnswers(UserAnswersStruct(
                  questionRef: widget!.question?.reference,
                  userAnswer: _model.answer,
                ));
                safeSetState(() {});

                await AnswersRecord.createDoc(currentUserReference!)
                    .set(createAnswersRecordData(
                  questionRef: widget!.question?.reference,
                  answer: _model.answer,
                  timestamp: getCurrentTimestamp,
                  isCorrect: _model.answer == widget!.question?.correctAnswer
                      ? true
                      : false,
                  areaRef: widget!.question?.area,
                ));
              },
              text: 'Check',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Noto Music',
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ].divide(SizedBox(height: 12.0)),
      ),
    );
  }
}
