import 'package:flutter/material.dart';
import 'package:plen_air_app/screens/boutique/boutique_widget.dart';
import 'package:plen_air_app/screens/menu/menu_widget.dart';
import 'package:plen_air_app/screens/results/results_widget.dart';
import 'package:plen_air_app/screens/settings/settings_widget.dart';
import 'package:plen_air_app/screens/travelling/travelling_widget.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-0.27, 1.13),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(9, 0, 9, 50),
        child: Container(
          width: 411,
          height: 65,
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(-0.94, 1.01),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Menu1Widget(),
                        ));
                      },
                      child: Image.asset(
                        'assets/images/Group.png',
                        width: 52.27,
                        height: 52.69,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.53, 1.02),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(23, 0, 0, 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const TravellingWidget(),
                        ));
                      },
                      child: Image.asset(
                        'assets/images/Vector_(1).png',
                        width: 52.27,
                        height: 52.69,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.12, 1.02),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50, 0, 0, 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const ResultsWidget(),
                        ));
                      },
                      child: Image.asset(
                        'assets/images/Mask_group.png',
                        width: 52.27,
                        height: 52.69,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.31, 1.02),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(80, 0, 0, 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const BoutiqueWidget(),
                        ));
                      },
                      child: Image.asset(
                        'assets/images/Group_3_(1).png',
                        width: 52.27,
                        height: 52.69,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.78, 1.01),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(220, 0, 0, 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SettingsWidget(),
                        ));
                      },
                      child: Image.asset(
                        'assets/images/g75.png',
                        width: 52.27,
                        height: 52.69,
                        fit: BoxFit.cover,
                      ),
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
