import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:plen_air_app/models/true_false_question.dart';
import 'package:plen_air_app/provider/game_provider.dart';
import 'package:plen_air_app/screens/story/story_widget.dart';
import 'package:plen_air_app/utils/utils.dart';
import 'package:plen_air_app/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'everyday_quiz_model.dart';
export 'everyday_quiz_model.dart';

class EverydayQuizWidget extends StatefulWidget {
  const EverydayQuizWidget({super.key});

  @override
  State<EverydayQuizWidget> createState() => _EverydayQuizWidgetState();
}

class _EverydayQuizWidgetState extends State<EverydayQuizWidget> {
  late EverydayQuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<TrueFalseQuestion> _questions = [];

  int _currentQuestionIndex = 0;

  late Timer _timer;

  int? _selectedOptionIndex;
  bool _isCorrect = false;

  int _remainingSeconds = 60;

  int _totalCoins = 0;
  int _answeredQuestions = 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EverydayQuizModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
  }

  @override
  void dispose() {
    _model.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _init() async {
    final provider = Provider.of<GameProvider>(context, listen: false);
    final jsonString =
        await rootBundle.loadString("assets/data/everyday_questions.json");
    final data = jsonDecode(jsonString);
    for (var questionData in data["questions"]) {
      _questions.add(TrueFalseQuestion.fromJson(questionData));
    }
    _totalCoins = provider.totalCoins;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) async {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer.cancel();
          await Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => StoryWidget(
              answeredQuestions: _answeredQuestions,
            ),
          ));
        }
        setState(() {});
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFF0B0B0B),
      body: _questions.isEmpty
          ? const Center(
              child: CupertinoActivityIndicator(
                color: Colors.white,
              ),
            )
          : SafeArea(
              top: true,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Stack(
                      children: [
                        const BottomNavigation(),
                        Align(
                          alignment: const AlignmentDirectional(0.83, -0.4),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                17, 0, 17, 15),
                            child: Container(
                              width: 129,
                              height: 73,
                              decoration: BoxDecoration(
                                color: const Color(0xFF303030),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 55, 0),
                                  child: Text(
                                    '10',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: 26,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.86, -0.42),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                17, 0, 17, 0),
                            child: Container(
                              width: 129,
                              height: 73,
                              decoration: BoxDecoration(
                                color: const Color(0xFF303030),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Text(
                                  formatTime(_remainingSeconds),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 26,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.09, 0.28),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                32, 0, 32, 0),
                            child: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  _selectedOptionIndex = 0;
                                  _isCorrect = _questions[_currentQuestionIndex]
                                          .answer ==
                                      true;
                                  if (_isCorrect) {
                                    _answeredQuestions++;
                                    _totalCoins += 10;
                                  }
                                });
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                if (_currentQuestionIndex + 1 >=
                                    _questions.length) {
                                  await Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => StoryWidget(
                                      answeredQuestions: _answeredQuestions,
                                    ),
                                  ));
                                }
                                setState(() {
                                  _isCorrect = false;
                                  _currentQuestionIndex++;
                                  _selectedOptionIndex = null;
                                });
                              },
                              child: Container(
                                width: 139,
                                height: 81,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF303030),
                                  borderRadius: BorderRadius.circular(13),
                                  border: Border.all(
                                    color: _selectedOptionIndex == 0
                                        ? _isCorrect
                                            ? const Color(0xFFFF1212)
                                            : const Color(0xFF24FF00)
                                        : Colors.transparent,
                                  ),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Text(
                                    'True',
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
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.76, -0.37),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 10, 55),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/Umbrella.png',
                                width: 53.49,
                                height: 52,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.05, -0.09),
                          child: Text(
                            _questions[_currentQuestionIndex].question,
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
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.01, -0.78),
                          child: Text(
                            'Beautiful France',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 26,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.12, 0.28),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            _selectedOptionIndex = 1;
                            _isCorrect =
                                _questions[_currentQuestionIndex].answer ==
                                    true;
                            if (_isCorrect) {
                              _answeredQuestions++;
                              _totalCoins += 10;
                            }
                          });
                          await Future.delayed(const Duration(seconds: 2));
                          if (_currentQuestionIndex + 1 >= _questions.length) {
                            // await Navigator.of(context)
                            //     .pushReplacement(MaterialPageRoute(
                            //   builder: (context) => StoryWidget(
                            //     answeredQuestions: _answeredQuestions,
                            //   ),
                            // ));
                            debugPrint("Finish");
                          }
                          setState(() {
                            _isCorrect = false;
                            _currentQuestionIndex++;
                            _selectedOptionIndex = null;
                          });
                        },
                        child: Container(
                          width: 149,
                          height: 82,
                          decoration: BoxDecoration(
                            color: const Color(0xFF303030),
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                              color: _selectedOptionIndex == 1
                                  ? _isCorrect
                                      ? const Color(0xFFFF1212)
                                      : const Color(0xFF24FF00)
                                  : Colors.transparent,
                            ),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Text(
                              'False',
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
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
