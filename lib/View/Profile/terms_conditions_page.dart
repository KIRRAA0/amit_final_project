import 'package:amit_final_project/View/Widgets/inter_text_style.dart';
import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InterTextStyle.getTextWidget(text: 'Lorem ipsum dolor', size: 22),
              const SizedBox(
                height: 5,
              ),
              InterTextStyle.getTextWidget(
                  size: 15,
                  opacity: 0.5,
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'),
              InterTextStyle.getTextWidget(text: 'Lorem ipsum dolor', size: 22),
              const SizedBox(
                height: 5,
              ),
              InterTextStyle.getTextWidget(
                  size: 15,
                  opacity: 0.5,
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'),
            ],
          ),
        ),
      ),
    );
  }
}
