import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/custom_button.dart';
import 'create_new_password.dart';

class CheckMail extends StatelessWidget {
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
                'assets/email.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'Check your email',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'We have sent a reset password to your email.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  Get.to(() => CreateNewPassword());
                },
                text: 'Open email app',
                isButtonEnabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
