import 'package:plen_air_app/screens/info/info_widget.dart';
import 'package:plen_air_app/screens/menu/menu_widget.dart';
import 'package:plen_air_app/utils/utils.dart';
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.05),
                FFButtonWidget(
                  onPressed: () {},
                  text: 'You\'ve opened an interesting story!',
                  options: FFButtonOptions(
                    width: screenWidth,
                    padding: EdgeInsetsDirectional.symmetric(
                        vertical: screenHeight * 0.04,
                        horizontal: screenWidth * 0.03),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: const Color(0xFF303030),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
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
                SizedBox(height: screenHeight * 0.05),
                Text(
                  "${widget.answeredQuestions}/10",
                  style: const TextStyle(color: Colors.white, fontSize: 40),
                ),
                SizedBox(height: screenHeight * 0.05),
                FFButtonWidget(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const InfoWidget(
                        text:
                            """In the heart of Paris, just as the sun dipped behind the Eiffel Tower, casting a golden glow across the Seine, a young artist named Camille sat by the riverbank with her sketchbook. Every evening, she would come here to capture the city’s essence—the graceful arches of the bridges, the lively chatter of people passing by, and the ever-changing light that danced on the water.

Camille had moved to Paris from a small village, drawn by the city's charm and its reputation as a haven for dreamers and creators. She rented a tiny apartment in Montmartre, where the scent of fresh baguettes filled the air each morning. From her window, she could see the dome of Sacré-Cœur, always reminding her why she had chosen this place.

One evening, as she sketched the silhouette of the Eiffel Tower, an elderly man approached her. He watched in silence for a few moments before speaking, his voice soft but filled with wisdom.

"Paris has a way of capturing not just your pencil, but your heart," he said with a smile. He introduced himself as Henri, an old painter who had once roamed these same streets in his youth. They spoke for hours about art, life, and the city's endless inspiration.

From that day on, Camille often found Henri sitting by the river, watching as she created new pieces. He shared stories of Paris long ago, of the artists and writers who had called it home, and of how the city had shaped his life.

Though Paris was vast and full of people, it was these quiet moments—the unexpected friendships, the golden light of sunset, and the timeless beauty of the city—that made Camille realize she had found more than just a place to sketch. She had found a home.

And with each new drawing, she felt a deeper connection to Paris, as if the city itself was helping her paint her story.""",
                        title: "Short story",
                      ),
                    ));
                  },
                  text: 'Read',
                  options: FFButtonOptions(
                    width: screenWidth,
                    padding: EdgeInsetsDirectional.symmetric(
                        vertical: screenHeight * 0.03),
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
                SizedBox(height: screenHeight * 0.05),
                FFButtonWidget(
                  onPressed: () async {
                    await Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                      builder: (context) => const Menu1Widget(),
                    ));
                  },
                  text: 'Pass',
                  options: FFButtonOptions(
                    width: screenWidth,
                    padding: EdgeInsetsDirectional.symmetric(
                        vertical: screenHeight * 0.03),
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
