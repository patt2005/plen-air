import 'package:flutter/services.dart';
import 'package:plen_air_app/screens/info/info_widget.dart';
import 'package:plen_air_app/utils/utils.dart';
import 'package:plen_air_app/widgets/bottom_navigation.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'recommendation_model.dart';
export 'recommendation_model.dart';

class RecommendationWidget extends StatefulWidget {
  const RecommendationWidget({super.key});

  @override
  State<RecommendationWidget> createState() => _RecommendationWidgetState();
}

class _RecommendationWidgetState extends State<RecommendationWidget> {
  late RecommendationModel _model;

  Map<String, dynamic>? data;

  final List<String> _infoIds = [
    "Travel Preparation",
    "Health While Traveling",
    "Emergency Situations",
    "Real Tourist Stories",
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecommendationModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void _init() async {
    final jsonString =
        await rootBundle.loadString("assets/data/vaccination.json");
    data = jsonDecode(jsonString);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF0B0B0B),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Safety and health',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 30,
                        letterSpacing: 0.0,
                      ),
                ),
                SizedBox(height: screenHeight * 0.02),
                FFButtonWidget(
                  onPressed: () async {
                    await Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                      builder: (context) => InfoWidget(
                          title: _infoIds[2], text: data!["info"][_infoIds[2]]),
                    ));
                  },
                  text: 'Emergency situations',
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
                          fontSize: 24,
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
                SizedBox(height: screenHeight * 0.02),
                FFButtonWidget(
                  onPressed: () async {
                    await Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                      builder: (context) => InfoWidget(
                          title: _infoIds[1], text: data!["info"][_infoIds[1]]),
                    ));
                  },
                  text: 'Health while traveling',
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
                          fontSize: 24,
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
                SizedBox(height: screenHeight * 0.02),
                FFButtonWidget(
                  onPressed: () async {
                    await Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                      builder: (context) => InfoWidget(
                          title: _infoIds[3], text: data!["info"][_infoIds[3]]),
                    ));
                  },
                  text: 'Real stories of tourists',
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
                          fontSize: 24,
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
                SizedBox(height: screenHeight * 0.02),
                FFButtonWidget(
                  onPressed: () async {
                    await Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                      builder: (context) => InfoWidget(
                          title: _infoIds[0], text: data!["info"][_infoIds[0]]),
                    ));
                  },
                  text: 'Travel preparation',
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
                          fontSize: 24,
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
      ),
    );
  }
}
