double musicVolume = 0.5;

late double screenWidth;
late double screenHeight;

List<String> easyModeQuizCategories = [
  "Mont-Saint-Michel",
  "Massif du Vaucluse",
  "Lavender Fields of Provence",
  "Loire Valley",
  "Côte d'Azur",
  "Chamonix-Mont-Blanc",
  "Brittany",
  "Corsica",
  "Provence",
  "Alps",
];

String formatTime(int seconds) {
  final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
  final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
  return '$minutes:$remainingSeconds';
}
