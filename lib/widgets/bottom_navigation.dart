import 'package:flutter/material.dart';
import 'package:plen_air_app/screens/boutique/boutique_widget.dart';
import 'package:plen_air_app/screens/menu/menu_widget.dart';
import 'package:plen_air_app/screens/results/results_widget.dart';
import 'package:plen_air_app/screens/settings/settings_widget.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A), // Dark background color
          borderRadius: BorderRadius.circular(35), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(
              context,
              iconPath: 'assets/images/Group.png',
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Menu1Widget()),
              ),
            ),
            _buildNavItem(
              context,
              iconPath: 'assets/images/Mask_group.png',
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const ResultsWidget()),
              ),
            ),
            _buildNavItem(
              context,
              iconPath: 'assets/images/Group_3_(1).png',
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const BoutiqueWidget()),
              ),
            ),
            _buildNavItem(
              context,
              iconPath: 'assets/images/g75.png',
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SettingsWidget()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required String iconPath, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50, // Width of each navigation item
        height: 50, // Height of each navigation item
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            width: 40, // Consistent icon size
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
