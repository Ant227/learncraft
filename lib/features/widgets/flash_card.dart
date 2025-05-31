import 'package:flutter/material.dart';

class FlashcardWidget extends StatefulWidget {
  final String question;
  final String answer;

  const FlashcardWidget({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  State<FlashcardWidget> createState() => _FlashcardWidgetState();
}

class _FlashcardWidgetState extends State<FlashcardWidget> {
  bool showAnswer = false;

  void _toggle() {
    setState(() {
      showAnswer = !showAnswer;
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
            "Flashcard",
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 10),
          Text(
            showAnswer ? widget.answer : widget.question,
            style: const TextStyle(fontSize: 15, letterSpacing: -0.24),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: _toggle,
            child: Text(showAnswer ? "Hide answer" : "Show answer"),
          ),
        ],
      ),
    );
  }
}
