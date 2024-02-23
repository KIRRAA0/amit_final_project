import 'package:amit_final_project/View/Widgets/inter_text_style.dart';
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              InterTextStyle.getTextWidget(
                  text: 'Applied', size: 12, opacity: 0.5),
              InterTextStyle.getTextWidget(text: '46', size: 20),
            ],
          ),
          SizedBox(
              height: 50,
              child: VerticalDivider(
                thickness: 1,
                color: Colors.black.withOpacity(0.3),
              )),
          Column(
            children: [
              InterTextStyle.getTextWidget(
                  text: 'Reviewed', size: 12, opacity: 0.5),
              InterTextStyle.getTextWidget(text: '23', size: 20),
            ],
          ),
          SizedBox(
              height: 50,
              child: VerticalDivider(
                thickness: 1,
                color: Colors.black.withOpacity(0.3),
              )),
          Column(
            children: [
              InterTextStyle.getTextWidget(
                  text: 'Contacted', size: 12, opacity: 0.5),
              InterTextStyle.getTextWidget(text: '16', size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
