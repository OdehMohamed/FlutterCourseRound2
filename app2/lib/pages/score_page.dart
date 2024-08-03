import 'package:app2/models/question_model.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  final int? questionIndex;
  final int? score;
  final void Function()? onTap;
  const ScorePage({super.key, this.questionIndex, this.score, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        key: ValueKey(questionIndex),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 280,
          ),
          const Text(
            "Quiz completed!",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          AnimatedOpacity(
            opacity: 1,
            duration: const Duration(seconds: 5),
            child: Text(
              "Score: $score/${questionsWithAnswers.length}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          TextButton(
              onPressed: onTap,
              child: const Text(
                "Reset",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
