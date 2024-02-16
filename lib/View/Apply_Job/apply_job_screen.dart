import 'package:amit_final_project/View/Apply_Job/type_of_work_screen.dart';
import 'package:amit_final_project/View/Apply_Job/upload_portfolio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/stepper_row.dart';
import 'biodata_page.dart';

class ApplyJob extends StatelessWidget {
  const ApplyJob({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final StepperController stepperController = Get.put(StepperController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply Job'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          StepperWidget(stepperController: stepperController),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (int index) {
                stepperController.goToStep(index);
              },
              children:  [
                BiodataPage(),
                TypeOfWorkPage(),
                UploadPortfolioPage(),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final currentPageIndex = pageController.page!.round();
              pageController.animateToPage(
                currentPageIndex + 1,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
            child: const Text('Next Page'),
          ),
        ],
      ),
    );
  }
}

class StepperController extends GetxController {
  var currentStep = 0.obs;

  void goToStep(int step) {
    currentStep.value = step;
  }
}
