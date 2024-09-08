import 'package:plen_air_app/widgets/bottom_navigation.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'boutique_model.dart';
export 'boutique_model.dart';

class BoutiqueWidget extends StatefulWidget {
  const BoutiqueWidget({super.key});

  @override
  State<BoutiqueWidget> createState() => _BoutiqueWidgetState();
}

class _BoutiqueWidgetState extends State<BoutiqueWidget> {
  late BoutiqueModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BoutiqueModel());
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
              Stack(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-0.05, -1.04),
                        child: Text(
                          'Store',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 26,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                        ),
                        padding: const EdgeInsets.only(bottom: 100),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Image.asset(
                                "assets/images/boutique/$index.png",
                                width: 120,
                                height: 120,
                              ),
                              const SizedBox(height: 7),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 7),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF303030),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: 125,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "200",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/Umbrella.png",
                                      width: 45,
                                      height: 45,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const BottomNavigation(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
