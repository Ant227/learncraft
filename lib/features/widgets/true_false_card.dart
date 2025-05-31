import 'package:flutter/material.dart';

class TrueFalseQuestionCard extends StatefulWidget {
  final String question;
  final bool correctAnswer;

  const TrueFalseQuestionCard({
    super.key,
    required this.question,
    required this.correctAnswer,
  });

  @override
  State<TrueFalseQuestionCard> createState() => _TrueFalseQuestionCardState();
}

class _TrueFalseQuestionCardState extends State<TrueFalseQuestionCard> {
  bool? selected;
  bool? isCorrect;

  void _select(bool value) {
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
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _select(true),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: selected == true
                        ? (isCorrect == true ? Colors.green : Colors.redAccent)
                        : null,
                  ),
                  child: const Text(
                    "True",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _select(false),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: selected == false
                        ? (isCorrect == true ? Colors.green : Colors.redAccent)
                        : null,
                  ),
                  child: const Text(
                    "False",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          if (isCorrect != null)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                isCorrect!
                    ? "✅ Correct."
                    : "❌ Wrong: Answer is ${widget.correctAnswer}.",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
