import 'package:plen_air_app/screens/easy/easy_widget.dart';
import 'package:plen_air_app/screens/hard/hard_widget.dart';
import 'package:plen_air_app/utils/utils.dart';
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFF0B0B0B),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.07),
              FFButtonWidget(
                onPressed: () {},
                text: 'Quiz',
                options: FFButtonOptions(
                  width: screenWidth,
                  height: screenHeight * 0.1,
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: screenHeight * 0.02),
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
              SizedBox(height: screenHeight * 0.07),
              FFButtonWidget(
                onPressed: () async {
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HardWidget(),
                    ),
                  );
                },
                text: 'Hard',
                options: FFButtonOptions(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.1,
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: screenHeight * 0.02),
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
              SizedBox(height: screenHeight * 0.04),
              FFButtonWidget(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EasyWidget(),
                    ),
                  );
                },
                text: 'Easy',
                options: FFButtonOptions(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.1,
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: screenHeight * 0.02),
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
              const Spacer(),
              const BottomNavigation(),
            ],
          ),
        ),
      ),
    );
  }
}
