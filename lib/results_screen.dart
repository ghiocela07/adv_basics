import 'package:adv_basics/data/qustions.dart';
import 'package:adv_basics/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.restartQuiz
  });

  final List<String> chosenAnswers;

  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
        'is_correct':
            questions[i].answers[0] == chosenAnswers[i]
      });
    }

    return summary;
  }

  //   List<Map<String, Object>> getSummaryData() {
  //   final List<Map<String, Object>> summary = [];

  //   for (var i = 0; i < chosenAnswers.length; i++) {
  //     summary.add({
  //       'question_index': i,
  //       'question': questions[i].text,
  //       'correct_answer': questions[i].answers[0],
  //       'user_answer': chosenAnswers[i],
  //       'is_correct':
  //           questions[i].answers[0] == chosenAnswers[i]
  //     });
  //   }

  //   return summary;
  // }

  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) => 
       data['correct_answer'] == data['user_answer']
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 234, 180, 242),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(
              width: 80,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 234, 180, 242)),
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
