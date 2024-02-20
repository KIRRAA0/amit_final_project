import 'package:amit_final_project/View/Login_SignUp/setup_done.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_switcher/slide_switcher.dart';

import '../Widgets/custom_button.dart';
import '../Widgets/custom_choicechip.dart';

class PrefefredLocation extends StatefulWidget {
  const PrefefredLocation({Key? key}) : super(key: key);

  @override
  State<PrefefredLocation> createState() => _PrefefredLocationState();
}

class _PrefefredLocationState extends State<PrefefredLocation> {
  int switcherIndex1 = 0;
  List<bool> isSelected = List.generate(13, (index) => false);

  @override
  Widget build(BuildContext context) {
    List<String> countryNames = [
      'Argentina',
      'Brazil',
      'Canada',
      'Denmark',
      'Egypt',
      'Finland',
      'Greece',
      'Hungary',
      'India',
      'Japan',
      'Kenya',
      'Luxembourg',
      'Morocco',
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Where is your preferred location?',
                style: TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 33,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.24,
                ),
              ),
              const Text(
                'Let us know your work location preference, so we can adjust accordingly.',
                style: TextStyle(
                  color: Color(0xFF737379),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.16,
                ),
              ),
              SlideSwitcher(
                slidersGradients: const [
                  LinearGradient(colors: [Color(0xFF091A7A), Colors.blue])
                ],
                onSelect: (index) {
                  setState(() {
                    switcherIndex1 = index;
                  });
                },
                containerHeight: 40,
                containerWight: 300,
                children: const [
                  Text(
                    'Work from office',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Remote Work',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const Text(
                'Select the country you want for your job',
                style: TextStyle(
                  color: Color(0xFF737379),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Wrap(
                spacing: 18.0,
                runSpacing: 18.0,
                children: List.generate(
                  countryNames.length,
                  (index) => CustomChoiceChip(
                    label: countryNames[index],
                    isSelected: isSelected[index],
                    onTap: () {
                      setState(() {
                        isSelected[index] = !isSelected[index];
                      });
                    },
                  ),
                ),
              ),
              CustomButton(
                onPressed: () {
                  Get.to(() => SetupDone(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 500));
                },
                text: 'Next',
                isButtonEnabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
