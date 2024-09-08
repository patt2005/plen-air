class Question {
  final String text;
  final Map<String, dynamic> options;
  final String answerLetter;

  Question({
    required this.text,
    required this.options,
    required this.answerLetter,
  });

  static Question fromJson(Map<String, dynamic> jsonData) {
    return Question(
      text: jsonData["question"],
      options: jsonData["options"],
      answerLetter: jsonData["answer"],
    );
  }
}
