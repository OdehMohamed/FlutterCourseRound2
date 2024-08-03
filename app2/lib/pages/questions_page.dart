import 'package:app2/models/question_model.dart';
import 'package:app2/pages/score_page.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int questionIndex = 0;
  int score = 0;
  String? selectedAnswer;
  int questionCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: (questionIndex < questionsWithAnswers.length)
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        questionsWithAnswers[questionIndex].question,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Answer and get points!",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        children: [
                          Text(
                            "Step $questionCount ",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "of 4",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(.3)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            List.generate(questionsWithAnswers.length, (index) {
                          return Container(
                            width: 91,
                            height: 3,
                            decoration: BoxDecoration(
                              color: index < questionCount
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                          children: questionsWithAnswers[questionIndex]
                              .answers
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedAnswer = e;
                                      });
                                    },
                                    child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                            color: (selectedAnswer == e)
                                                ? Colors.green
                                                : null,
                                            border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(.3),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.color_lens,
                                              color: (selectedAnswer == e)
                                                  ? Colors.white
                                                  : null,
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Text(
                                              e,
                                              style: TextStyle(
                                                color: (selectedAnswer == e)
                                                    ? Colors.white
                                                    : null,
                                                fontWeight:
                                                    (selectedAnswer == e)
                                                        ? FontWeight.bold
                                                        : null,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              )
                              .toList()),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedAnswer = null;
                          });
                        },
                        child: const Text(
                          "Remove Selected",
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (selectedAnswer != null) {
                                if (selectedAnswer ==
                                    questionsWithAnswers[questionIndex]
                                        .correctAnswer) {
                                  setState(() {
                                    score++;
                                  });
                                }
                                setState(() {
                                  questionIndex++;
                                  questionCount++;
                                  selectedAnswer = null;
                                });
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      const Text("Please select an answer"),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: Colors.red,
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {},
                                  ),
                                  // actionTextColor: Colors.white,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                ));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text("Next"),
                          )),
                      (questionIndex > 0)
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (selectedAnswer ==
                                              questionsWithAnswers[
                                                      questionIndex]
                                                  .correctAnswer) {
                                            score--;
                                          }
                                          questionIndex--;
                                          questionCount--;
                                          selectedAnswer = null;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Text("Back"),
                                    )),
                              ],
                            )
                          : const Text(""),
                    ],
                  ),
                )
              : ScorePage(
                  questionIndex: questionIndex,
                  score: score,
                  onTap: () {
                    setState(() {
                      questionIndex = 0;
                      score = 0;
                      questionCount = 1;
                    });
                  },
                )),
    );
  }
}
