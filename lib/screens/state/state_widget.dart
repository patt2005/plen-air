import 'package:plen_air_app/utils/utils.dart';
import 'package:plen_air_app/widgets/bottom_navigation.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'state_model.dart';
export 'state_model.dart';

class StateWidget extends StatefulWidget {
  const StateWidget({
    super.key,
    required this.categoryIndex,
  });

  final int categoryIndex;

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  late StateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StateModel());
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/easy_quiz/${widget.categoryIndex}.png",
                    width: screenWidth,
                    height: screenHeight * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Mont Saint-Michel',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 26,
                        letterSpacing: 0.0,
                      ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: screenWidth,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: const Color(0xFF303030),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Mont-Saint-Michel is a magical island located in Normandy, on the border with Brittany. This unique architectural monument, rising from a rocky islet, seems to emerge from the mist when the tides cover the surrounding waters. The monastery at the top, with its Gothic towers and majestic buildings, impresses with its beauty and history. Inside, the narrow streets leading to the monastery are full of medieval charm, and the views of the bay from the top of the island are breathtaking. One can visit to admire the grandeur of the architecture and the atmosphere that seems to transport you to a distant past.',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                              fontSize: 15,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
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
