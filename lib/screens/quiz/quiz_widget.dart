import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:plen_air_app/models/question.dart';
import 'package:plen_air_app/provider/game_provider.dart';
import 'package:plen_air_app/screens/story/story_widget.dart';
import 'package:plen_air_app/utils/utils.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'quiz_model.dart';
export 'quiz_model.dart';

class QuizWidget extends StatefulWidget {
  final String categoryId;
  final int categoryIndex;

  const QuizWidget({
    super.key,
    required this.categoryId,
    required this.categoryIndex,
  });

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  late QuizModel _model;

  final List<Question> _questions = [];

  int _currentQuestionIndex = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  int? _selectedOptionIndex;
  bool _isCorrect = false;

  int _totalCoins = 0;
  int _answeredQuestions = 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadData());
  }

  void _loadData() async {
    final provider = Provider.of<GameProvider>(context, listen: false);
    final jsonString =
        await rootBundle.loadString("assets/data/questions.json");
    final data = jsonDecode(jsonString);
    for (var questionData in data["questions"][widget.categoryId]) {
      _questions.add(Question.fromJson(questionData));
    }
    _totalCoins = provider.totalCoins;
    setState(() {});
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _questions.isEmpty
        ? const Scaffold(
            body: Center(
              child: CupertinoActivityIndicator(
                color: Colors.white,
              ),
            ),
          )
        : Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFF0B0B0B),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            'assets/images/easy_quiz/${widget.categoryIndex}.png',
                            width: screenWidth,
                            height: screenHeight * 0.15,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Text(
                            widget.categoryId,
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
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 7),
                      decoration: BoxDecoration(
                        color: const Color(0xFF303030),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _totalCoins.toString(),
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
                          const SizedBox(width: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/Umbrella.png',
                              width: 53.49,
                              height: 52,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10, bottom: screenHeight * 0.02),
                      child: Text(
                        _questions[_currentQuestionIndex].text,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                              fontSize: 22,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    if (_questions[_currentQuestionIndex].options["A"] != null)
                      Container(
                        margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_selectedOptionIndex == null) {
                              setState(() {
                                _selectedOptionIndex = 0;
                                _isCorrect = _questions[_currentQuestionIndex]
                                        .answerLetter ==
                                    "A";
                                if (_isCorrect) {
                                  _answeredQuestions++;
                                  _totalCoins += 10;
                                }
                              });
                              await Future.delayed(const Duration(seconds: 2));
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
                            }
                          },
                          text: _questions[_currentQuestionIndex].options["A"],
                          options: FFButtonOptions(
                            width: screenWidth,
                            padding: EdgeInsetsDirectional.symmetric(
                                vertical: screenHeight * 0.015),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
                            color: const Color(0xFF303030),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 24,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: _selectedOptionIndex == 0
                                  ? _isCorrect
                                      ? const Color(0xFF24FF00)
                                      : const Color(0xFFFF1212)
                                  : Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                      ),
                    if (_questions[_currentQuestionIndex].options["B"] != null)
                      Container(
                        margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_selectedOptionIndex == null) {
                              setState(() {
                                _selectedOptionIndex = 1;
                                _isCorrect = _questions[_currentQuestionIndex]
                                        .answerLetter ==
                                    "B";
                                if (_isCorrect) {
                                  _answeredQuestions++;
                                  _totalCoins += 10;
                                }
                              });
                              await Future.delayed(const Duration(seconds: 2));
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
                            }
                          },
                          text: _questions[_currentQuestionIndex].options["B"],
                          options: FFButtonOptions(
                            width: screenWidth,
                            padding: EdgeInsetsDirectional.symmetric(
                                vertical: screenHeight * 0.015),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
                            color: const Color(0xFF303030),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 25,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: _selectedOptionIndex == 1
                                  ? _isCorrect
                                      ? const Color(0xFF24FF00)
                                      : const Color(0xFFFF1212)
                                  : Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                      ),
                    if (_questions[_currentQuestionIndex].options["C"] != null)
                      FFButtonWidget(
                        onPressed: () async {
                          if (_selectedOptionIndex == null) {
                            setState(() {
                              _selectedOptionIndex = 2;
                              _isCorrect = _questions[_currentQuestionIndex]
                                      .answerLetter ==
                                  "C";
                              if (_isCorrect) {
                                _answeredQuestions++;
                                _totalCoins += 10;
                              }
                            });
                            await Future.delayed(const Duration(seconds: 2));
                            if (_currentQuestionIndex + 1 >=
                                _questions.length) {
                              final provider = Provider.of<GameProvider>(
                                  context,
                                  listen: false);
                              await provider.setCoinsOnCategory(
                                  widget.categoryId, _totalCoins);
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
                          }
                        },
                        text: _questions[_currentQuestionIndex].options["C"],
                        options: FFButtonOptions(
                          width: screenWidth,
                          padding: EdgeInsetsDirectional.symmetric(
                              vertical: screenHeight * 0.015),
                          iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: const Color(0xFF303030),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 24,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: _selectedOptionIndex == 2
                                ? _isCorrect
                                    ? const Color(0xFFFF1212)
                                    : const Color(0xFF24FF00)
                                : Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    SizedBox(height: screenHeight * 0.02),
                    SizedBox(
                      height: screenHeight * 0.08,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              decoration: BoxDecoration(
                                color: const Color(0xFF303030),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    if (_totalCoins >= 10) {
                                      Map<String, dynamic> optionsMap =
                                          _questions[_currentQuestionIndex]
                                              .options;
                                      String correctLetter =
                                          _questions[_currentQuestionIndex]
                                              .answerLetter;

                                      List<dynamic> incorrectOptions =
                                          optionsMap.keys.where((option) {
                                        return option != correctLetter;
                                      }).toList();

                                      if (incorrectOptions.isNotEmpty) {
                                        optionsMap.removeWhere(
                                          (key, value) =>
                                              key == incorrectOptions.first,
                                        );
                                      }

                                      debugPrint(optionsMap.toString());
                                      _totalCoins -= 10;
                                      setState(() {});
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/Vector_(2).png',
                                      width: 58,
                                      height: 58,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.1),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF303030),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    if (_totalCoins >= 20) {
                                      _answeredQuestions++;
                                      _totalCoins -= 20;
                                      _currentQuestionIndex++;
                                      setState(() {});
                                    }
                                  },
                                  child: Text(
                                    'Next',
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
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    SizedBox(
                      height: screenHeight * 0.08,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF303030),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '20',
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/Umbrella.png',
                                      width: 53.49,
                                      height: 52,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.1),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF303030),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '10',
                                    textAlign: TextAlign.start,
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/Umbrella.png',
                                      width: 53.49,
                                      height: 52,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
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
  }
}
