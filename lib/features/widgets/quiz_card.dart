import 'package:flutter/material.dart';

class QuizQuestionCard extends StatefulWidget {
  final String question;
  final List<String> options;
  final String correctAnswer;

  const QuizQuestionCard({
    super.key,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  @override
  State<QuizQuestionCard> createState() => _QuizQuestionCardState();
}

class _QuizQuestionCardState extends State<QuizQuestionCard> {
  String? selected;
  bool? isCorrect;

  void _onSelect(String value) {
    setState(() {
      selected = value;
      isCorrect = value == widget.correctAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE6E6E6)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Quizz",
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 10),
          Text(
            widget.question,
            style: const TextStyle(fontSize: 15, letterSpacing: -0.24),
          ),
          const SizedBox(height: 10),
          ...widget.options.map(
            (option) => Row(
              children: [
                Radio<String>(
                  value: option,
                  groupValue: selected,
                  onChanged: (val) => _onSelect(val!),
                ),
                Flexible(child: Text(option)),
              ],
            ),
          ),
          if (isCorrect != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                isCorrect!
                    ? "✅ Correct: ${widget.correctAnswer}."
                    : "❌ Wrong: Correct answer is '${widget.correctAnswer}'.",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
