import 'package:plen_air_app/screens/easy/easy_widget.dart';
import 'package:plen_air_app/screens/hard/hard_widget.dart';
import 'package:plen_air_app/widgets/bottom_navigation.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'mode_model.dart';
export 'mode_model.dart';

class ModeWidget extends StatefulWidget {
  const ModeWidget({super.key});

  @override
  State<ModeWidget> createState() => _ModeWidgetState();
}

class _ModeWidgetState extends State<ModeWidget> {
  late ModeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModeModel());
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
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HardWidget(),
                        ),
                      );
                    },
                    text: 'Hard',
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(17, 50, 17, 0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Qu pressed ...');
                  },
                  text: 'Quiz',
                  options: FFButtonOptions(
                    width: 396,
                    height: 81,
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: const Color(0xFF303030),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
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
              Align(
                alignment: const AlignmentDirectional(0, -0.47),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(17, 70, 17, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const EasyWidget(),
                        ),
                      );
                    },
                    text: 'Easy',
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
            ],
          ),
        ),
      ),
    );
  }
}
