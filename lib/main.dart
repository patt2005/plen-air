import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:plen_air_app/flutter_flow/flutter_flow_theme.dart';
import 'package:plen_air_app/provider/game_provider.dart';
import 'package:plen_air_app/screens/welcome/welcome_widget.dart';
import 'package:plen_air_app/utils/utils.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterFlowTheme.initialize();
  FlameAudio.bgm.initialize();
  await FlameAudio.bgm.play(
    'music.mp3',
    volume: musicVolume,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: const WelcomeWidget(),
    );
  }
}
