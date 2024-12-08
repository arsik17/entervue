import '/backend/backend.dart';
import '/components/multiple_choice_template_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'multiple_choice_page_model.dart';
export 'multiple_choice_page_model.dart';

class MultipleChoicePageWidget extends StatefulWidget {
  const MultipleChoicePageWidget({
    super.key,
    required this.areaRef,
  });

  final DocumentReference? areaRef;

  @override
  State<MultipleChoicePageWidget> createState() =>
      _MultipleChoicePageWidgetState();
}

class _MultipleChoicePageWidgetState extends State<MultipleChoicePageWidget> {
  late MultipleChoicePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultipleChoicePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiary,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.chevron_left_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 32.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: StreamBuilder<AreasRecord>(
                          stream: AreasRecord.getDocument(widget!.areaRef!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: SpinKitRing(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  ),
                                ),
                              );
                            }

                            final textAreasRecord = snapshot.data!;

                            return Text(
                              textAreasRecord.areaName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                  ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                if (false)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiary,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        Container(
                          width: 50.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent3,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        Container(
                          width: 50.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent3,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        Container(
                          width: 50.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent3,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        Container(
                          width: 50.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent3,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        Container(
                          width: 50.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent3,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                Flexible(
                  child: StreamBuilder<List<QuestionsRecord>>(
                    stream: queryQuestionsRecord(
                      queryBuilder: (questionsRecord) => questionsRecord
                          .where(
                            'area',
                            isEqualTo: widget!.areaRef,
                          )
                          .where(
                            'type',
                            isEqualTo: 'multiple_choice',
                          ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: SpinKitRing(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                          ),
                        );
                      }
                      List<QuestionsRecord> pageViewQuestionsRecordList =
                          snapshot.data!;

                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _model.pageViewController ??=
                                PageController(
                                    initialPage: max(
                                        0,
                                        min(
                                            0,
                                            pageViewQuestionsRecordList.length -
                                                1))),
                            scrollDirection: Axis.horizontal,
                            itemCount: pageViewQuestionsRecordList.length,
                            itemBuilder: (context, pageViewIndex) {
                              final pageViewQuestionsRecord =
                                  pageViewQuestionsRecordList[pageViewIndex];
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: MultipleChoiceTemplateWidget(
                                          key: Key(
                                              'Keyxkk_${pageViewIndex}_of_${pageViewQuestionsRecordList.length}'),
                                          index: pageViewIndex,
                                          question: pageViewQuestionsRecord,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (pageViewIndex != 0)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await _model.pageViewController
                                                  ?.previousPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            },
                                            text: 'Back',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Noto Music',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    letterSpacing: 0.0,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                          ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            await _model.pageViewController
                                                ?.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          },
                                          text: 'Next',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Noto Music',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ].divide(SizedBox(height: 24.0)),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
