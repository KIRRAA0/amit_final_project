import 'package:amit_final_project/View/Login_SignUp/prefefred_location.dart';
import 'package:amit_final_project/View/Widgets/custom_button.dart';
import 'package:amit_final_project/View/Widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InterestsPage extends StatefulWidget {
  const InterestsPage({Key? key}) : super(key: key);

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  List<InterestData> interestDataList = [
    InterestData(
        icon: MdiIcons.familyTree, text: 'UI/UX Designer', isSelected: false),
    InterestData(
        icon: MdiIcons.drawPen,
        text: 'Illustrator Designer',
        isSelected: false),
    InterestData(
        icon: MdiIcons.codeBraces, text: 'Developer', isSelected: false),
    InterestData(
        icon: MdiIcons.chartPie, text: 'Management', isSelected: false),
    InterestData(
        icon: MdiIcons.devices, text: 'Information Tech', isSelected: false),
    InterestData(
        icon: MdiIcons.appleIcloud,
        text: 'Research and analytics',
        isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'What type of work are you interested in?',
                style: TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 33,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.24,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Tell us what you’re interested in so we can customize the app for your needs.',
                style: TextStyle(
                  color: Color(0xFF737379),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.16,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: interestDataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCard(
                      isSelected: interestDataList[index].isSelected,
                      onTap: () {
                        setState(() {
                          interestDataList[index].isSelected =
                              !interestDataList[index].isSelected;
                        });
                      },
                      iconData: interestDataList[index].icon,
                      cardText: interestDataList[index].text,
                    );
                  },
                ),
              ),
              CustomButton(
                  onPressed: () {
                    Get.to(() => const PrefefredLocation());
                  },
                  text: 'Next',
                  isButtonEnabled: true)
            ],
          ),
        ),
      ),
    );
  }
}

class InterestData {
  final IconData icon;
  final String text;
  bool isSelected;

  InterestData({
    required this.icon,
    required this.text,
    required this.isSelected,
  });
}
