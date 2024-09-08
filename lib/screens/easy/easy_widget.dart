import 'package:plen_air_app/screens/quiz/quiz_widget.dart';
import 'package:plen_air_app/utils/utils.dart';
import 'package:plen_air_app/widgets/bottom_navigation.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'easy_model.dart';
export 'easy_model.dart';

class EasyWidget extends StatefulWidget {
  const EasyWidget({super.key});

  @override
  State<EasyWidget> createState() => _EasyWidgetState();
}

class _EasyWidgetState extends State<EasyWidget> {
  late EasyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EasyModel());
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(17, 0, 17, 0),
                child: FFButtonWidget(
                  onPressed: () {},
                  text: 'Easy',
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
              Container(
                margin: const EdgeInsets.only(top: 100),
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: easyModeQuizCategories.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QuizWidget(
                              categoryId: easyModeQuizCategories[index],
                              categoryIndex: index,
                            ),
                          ));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.asset(
                                  "assets/images/easy_quiz/$index.png",
                                  width: 362,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      easyModeQuizCategories[index],
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontSize: 26,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
