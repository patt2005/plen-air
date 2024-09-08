import 'package:plen_air_app/screens/menu/menu_widget.dart';
import 'package:plen_air_app/widgets/bottom_navigation.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'story_model.dart';
export 'story_model.dart';

class StoryWidget extends StatefulWidget {
  final int answeredQuestions;

  const StoryWidget({
    super.key,
    required this.answeredQuestions,
  });

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  late StoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoryModel());
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
        backgroundColor: const Color(0xFF0B0B0B),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              const BottomNavigation(),
              Align(
                alignment: const AlignmentDirectional(0, -0.01),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(17, 100, 17, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(
                        builder: (context) => const Menu1Widget(),
                      ));
                    },
                    text: 'To pass',
                    options: FFButtonOptions(
                      width: 396,
                      height: 81,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: const Color(0xFF303030),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 26,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -0.31),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(17, 50, 17, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Qu pressed ...');
                    },
                    text: 'Read',
                    options: FFButtonOptions(
                      width: 396,
                      height: 81,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: const Color(0xFF303030),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 26,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.11),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(17, 70, 17, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'You\'ve opened an interesting story!',
                    options: FFButtonOptions(
                      width: 357,
                      height: 110,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: const Color(0xFF303030),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 28,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 3,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.11),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(17, 200, 17, 0),
                  child: Text(
                    "${widget.answeredQuestions}/10",
                    style: const TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
