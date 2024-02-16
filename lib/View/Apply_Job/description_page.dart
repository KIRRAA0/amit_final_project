import 'package:amit_final_project/View/Widgets/inter_text_style.dart';
import 'package:flutter/material.dart';

import '../../Model/jobs_model.dart';
import '../Widgets/job_details_body.dart';
class DescriptionPage extends StatelessWidget {
  final JobModel job;

  const DescriptionPage({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InterTextStyle.getTextWidget(text: "Job description"),
          JobDetailsText(text: job.jobDescription),
          const SizedBox(height: 10,),
          InterTextStyle.getTextWidget(text: "Skill Requirements"),
          JobDetailsText(text: job.jobSkill),
        ],
      ),
    );
  }
}
