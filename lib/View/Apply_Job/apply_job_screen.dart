import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../API/Api_helper.dart';
import '../../API/apply_job_API.dart';
import '../../Model/jobs_model.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/stepper_row.dart';
import 'application_complete.dart';
import 'biodata_page.dart';
import 'type_of_work_screen.dart';
import 'upload_portfolio.dart';

class ApplyJob extends StatelessWidget {
  final JobModel job;

  const ApplyJob({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StepperController stepperController = Get.put(StepperController());
    final PageController pageController = PageController();
    var apiData = ApiData();

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
              children: const [
                BiodataPage(),
                TypeOfWorkPage(),
                UploadPortfolioPage(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              final currentPageIndex = stepperController.currentStep.value;
              final isLastPage = currentPageIndex ==
                  2; // Assuming 2 is the index of the last page
              final buttonText = isLastPage ? 'Submit' : 'Next';

              return CustomButton(
                onPressed: () {
                  if (isLastPage) {
                    applyToJob(job);
                    Get.to(() => ApplicationComplete(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 500));
                  } else {
                    final nextPageIndex = currentPageIndex + 1;
                    stepperController.goToStep(nextPageIndex);
                    pageController.animateToPage(
                      nextPageIndex,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                text: buttonText,
                isButtonEnabled: true,
              );
            }),
          )
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
