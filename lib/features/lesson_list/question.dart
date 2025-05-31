import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learncraft/data/models/lesson_model.dart';
import '../widgets/flash_card.dart';
import '../widgets/quiz_card.dart';
import '../widgets/true_false_card.dart';

class QuestionLesson extends StatefulWidget {
  const QuestionLesson({super.key, required this.lesson});

  final LessonModel lesson;

  @override
  State<QuestionLesson> createState() => _QuestionLessonState();
}

class _QuestionLessonState extends State<QuestionLesson> {
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title, style: TextStyle(fontSize: 15)),
      ),
      body: isLoading
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ListView(
                children: const [
                  QuizQuestionCard(
                    question:
                        "You see this sign on the door. “Employees Only”. What does it mean?",
                    options: [
                      "Everyone is welcome",
                      "Only staff can enter",
                      "The shop is closed",
                      "You need a key to enter",
                    ],
                    correctAnswer: "Only staff can enter",
                  ),
                  TrueFalseQuestionCard(
                    question:
                        "If you read a food label, you can find out how many calories are in it.",
                    correctAnswer: true,
                  ),
                  FlashcardWidget(
                    question:
                        "What should you do when you see the word ‘Caution’ on a sign?",
                    answer:
                        "Be careful – there may be danger or something to watch out for.",
                  ),
                ],
              ),
            ),
    );
  }
}
