import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Widgets/profile_widgets/personal_details_tile.dart';
import '../Widgets/profile_widgets/vertical_divider.dart';
import 'edit_profile_screen.dart';

class CompleteProfile extends StatefulWidget {
  CompleteProfile({Key? key}) : super(key: key);

  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  late double completionProgress;
  late List<Map<String, dynamic>> details;

  @override
  void initState() {
    super.initState();
    completionProgress = 0.0;
    details = [
      {
        'title': 'Personal Details',
        'subtitle': 'Full name, email, phone number, and your address',
        'onTap': () {
          setState(() {
            completionProgress += 0.25;
          });
          Get.to(() => const EditProfilePage(),
              transition: Transition.rightToLeftWithFade,
              duration: const Duration(milliseconds: 500));
        },
      },
      {
        'title': 'Education',
        'subtitle': 'Enter your educational history to be considered by the recruiter',
        'onTap': () {
          setState(() {
            completionProgress += 0.25;
          });
        },
      },
      {
        'title': 'Experience',
        'subtitle': 'Enter your work experience to be considered by the recruiter',
        'onTap': () {
          setState(() {
            completionProgress += 0.25;
          });
        },
      },
      {
        'title': 'Portfolio',
        'subtitle': 'Create your portfolio. Applying for various types of jobs is easier.',
        'onTap': () {
          setState(() {
            completionProgress += 0.25;
          });
        },
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(
            children: [
              Center(
                child: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  radius: 60.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: completionProgress,
                  footer: Text('${(completionProgress * 100).toInt()}% Completed'),
                  center: const Text(
                    "",
                    style: TextStyle(fontSize: 20),
                  ),
                  progressColor: Colors.blue,
                ),
              ),
              const SizedBox(height: 12),
              ...details.map((detail) => Column(
                children: [
                  PersonalDetailsWidget(
                    title: detail['title']!,
                    subtitle: detail['subtitle']!,
                    onTap: detail['onTap'],
                  ),
                  if (details.last != detail) ...[
                    VerticalDividerr(),
                  ]
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
