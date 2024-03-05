import 'package:amit_final_project/View/Profile/portfolio_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Widgets/profile_widgets/personal_details_tile.dart';
import '../Widgets/profile_widgets/vertical_divider.dart';
import 'edit_profile_screen.dart';
import 'education_page.dart';

class CompleteProfile extends StatefulWidget {
  CompleteProfile({Key? key}) : super(key: key);

  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  late double completionProgress;
  late List<Map<String, dynamic>> details;
  late List<bool> isClickedList;

  @override
  void initState() {
    super.initState();
    completionProgress = 0.0;
    isClickedList = List.generate(4, (_) => false); // Initialize list to false
    details = [
      {
        'title': 'Personal Details',
        'subtitle': 'Full name, email, phone number, and your address',
        'onTap': () {
          if (!isClickedList[0]) {
            setState(() {
              completionProgress += 0.25;
              isClickedList[0] = true;
            });
            Get.to(() => const EditProfilePage(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 500));
          }
        },
      },
      {
        'title': 'Education',
        'subtitle':
        'Enter your educational history to be considered by the recruiter',
        'onTap': () {
          if (!isClickedList[1]) {
            setState(() {
              completionProgress += 0.25;
              isClickedList[1] = true;
            });
            Get.to(() => const EducationPage(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 500));
          }
        },
      },
      {
        'title': 'Experience',
        'subtitle':
        'Enter your work experience to be considered by the recruiter',
        'onTap': () {
          if (!isClickedList[2]) {
            setState(() {
              completionProgress += 0.25;
              isClickedList[2] = true;
            });
            Get.to(() => const EducationPage(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 500));
          }
        },
      },
      {
        'title': 'Portfolio',
        'subtitle':
        'Create your portfolio. Applying for various types of jobs is easier.',
        'onTap': () {
          if (!isClickedList[3]) {
            setState(() {
              completionProgress += 0.25;
              isClickedList[3] = true;
            });
            Get.to(() => PortfolioPage(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 500));
          }
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
                  center: Text(
                    '${(completionProgress * 100).toInt()}%',
                    style: const TextStyle(fontSize: 20),
                  ),
                  progressColor: Colors.blue,
                ),
              ),
              const SizedBox(height: 12),
              ...details.asMap().entries.map((entry) => Column(
                children: [
                  PersonalDetailsWidget(
                    title: entry.value['title']!,
                    subtitle: entry.value['subtitle']!,
                    onTap: entry.value['onTap'],
                  ),
                  if (entry.key != details.length - 1) ...[
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
