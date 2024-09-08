class TrueFalseQuestion {
  final String question;
  final bool answer;

  TrueFalseQuestion({
    required this.question,
    required this.answer,
  });

  static TrueFalseQuestion fromJson(Map<String, dynamic> json) {
    return TrueFalseQuestion(
      question: json["question"],
      answer: json["answer"],
    );
  }
}
