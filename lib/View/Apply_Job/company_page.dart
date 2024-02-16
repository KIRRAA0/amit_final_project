import 'package:flutter/material.dart';

import '../../Model/jobs_model.dart';
import '../Widgets/contacts_container.dart';
import '../Widgets/inter_text_style.dart';
import '../Widgets/job_details_body.dart';

class CompanyPage extends StatelessWidget {
  final JobModel job;

  const CompanyPage({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InterTextStyle.getTextWidget(text: "Contact Us"),
          SizedBox(height: screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContactsContainer(
                firstText: 'Email',
                secondText: job.compEmail,
              ),
              ContactsContainer(
                firstText: 'Website',
                secondText: job.compWebsite,
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          InterTextStyle.getTextWidget(text: "About Company"),
          JobDetailsText(text: job.aboutComp),
          SizedBox(height: screenHeight * 0.02),
          InterTextStyle.getTextWidget(text: "Address"),
          JobDetailsText(text: job.location),
        ],
      ),
    );
  }
}
