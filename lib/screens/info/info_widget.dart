import 'package:flutter/material.dart';
import 'package:plen_air_app/widgets/bottom_navigation.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String text;

  const InfoWidget({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0B),
      body: SafeArea(
        child: Column(
          children: [
            // Title at the top
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Expanded text that scrolls if it's too long
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            // Bottom Navigation remains at the bottom
            const BottomNavigation(),
          ],
        ),
      ),
    );
  }
}
