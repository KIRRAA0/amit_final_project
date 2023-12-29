import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/create_account_controller.dart';
import '../HomeScreen_Search/home_screen.dart';
import '../Widgets/custom_button.dart';
import 'create_new_password.dart';

class PasswordChanged extends StatelessWidget {
  final RegistrationController controller = Get.find<RegistrationController>();

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
                'assets/Password.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'Password changed succesfully!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your password has been changed successfully, we will let you know if there are more problems with your account',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  Get.to(() =>  HomeScreen());
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
