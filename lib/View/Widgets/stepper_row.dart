import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Apply_Job/apply_job_screen.dart';
import '../Widgets/custom_stepper.dart';

class StepperWidget extends StatelessWidget {
  final StepperController stepperController;

  const StepperWidget({Key? key, required this.stepperController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(3, (index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CustomStepper(
                      stepIndex: index,
                      currentStep: stepperController.currentStep.value,
                      isCompleted: index < stepperController.currentStep.value,
                    ),
                    if (index==1)
                      const Text("Type of work")
                    else if (index==2)
                      const Text("Portfolio")
                    else
                      const Text(" Biodata")
                  ],
                ),
                if (index < 2)
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0,right: 5),
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: 40,
                          lineThickness: 1.5,
                          dashLength: 4.0,
                          dashColor: Colors.black,
                          dashRadius: 10.0,
                          dashGapLength: 4.0,
                        ),
                      ),
                      SizedBox(height: 14,)
                    ],
                  )
              ],
            );
          }),
        ),
      ),
    ));
  }
}
