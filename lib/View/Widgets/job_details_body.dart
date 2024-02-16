import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobDetailsText extends StatelessWidget {
  final String text;


  const JobDetailsText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    List<String> lines = text.split('\n');

    return Column(
      children: lines
          .map((line) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.circle,
              size: 7,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                line,
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ))
          .toList(),
    );
  }
}
