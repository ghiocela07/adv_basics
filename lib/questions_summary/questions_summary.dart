import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
   const QuestionsSummary(this.summaryData, {super.key});

  final wrongColor = const Color.fromARGB(255, 222, 124, 237);

  final correctColor = const Color.fromARGB(255, 131, 123, 240);

  final userColor = const Color.fromARGB(255, 222, 124, 237);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Container(
                 margin: const EdgeInsets.only(top:10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top:10),
                    padding: const EdgeInsets.all(6),
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:(data['is_correct'] as bool) ? correctColor : wrongColor ,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      ((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 7, 7, 7),
                        fontSize: 14
                      ),
                    ),
                  ),
                  const SizedBox(width: 30,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 220, 203, 246),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(
                            color: userColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                            color: correctColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
