import 'package:amit_final_project/View/HomeScreen_Search/HomeView.dart';
import 'package:amit_final_project/View/HomeScreen_Search/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/create_account_controller.dart';
import '../Widgets/custom_button.dart';

class ApplicationComplete extends StatelessWidget {
  final RegistrationController controller = Get.find<RegistrationController>();

  ApplicationComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: SizedBox.shrink(),
              ),
              Image.asset(
                'assets/applied.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'Your data has been sent!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'You will get a message from our team, about the announcement of employee acceptance',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  Get.offAll(
                        () => HomeContent(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 500),
                  );

                },
                text: 'Back to Home',
                isButtonEnabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
