import 'package:amit_final_project/View/Widgets/inter_text_style.dart';
import 'package:flutter/material.dart';

class AboutColumn extends StatelessWidget {
  const AboutColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterTextStyle.getTextWidget(text: 'About'),
              TextButton(onPressed: () {}, child: const Text('View'))
            ],
          ),
          const Text(
              "I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of."),

        ],
      ),
    );
  }
}
