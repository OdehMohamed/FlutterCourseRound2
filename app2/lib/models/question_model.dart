// ignore_for_file: public_member_api_docs, sort_constructors_first
class Question {
  final String question;
  final List<String> answers;
  final String correctAnswer;

  const Question({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}

List<Question> questionsWithAnswers = const [
  Question(
      question: "What is favorite color?",
      answers: ["Red", "Green", "Blue", "Black"],
      correctAnswer: "Red"),
  Question(
      question: "What is favorite animal?",
      answers: ["Dog", "Cat", "Bird", "Fish"],
      correctAnswer: "Cat"),
  Question(
      question: "What is favorite food?",
      answers: ["Apple", "Banana", "Mango", "Orange"],
      correctAnswer: "Orange"),
  Question(
      question: "What is favorite movie?",
      answers: ["Titanic", "Avatar", "Inception", "Interstellar"],
      correctAnswer: "Avatar"),
];
