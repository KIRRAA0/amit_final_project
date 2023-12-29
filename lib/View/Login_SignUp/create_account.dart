import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/create_account_controller.dart';
import '../Widgets/custom_appbar.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_divider.dart';
import '../Widgets/custom_outlined_button.dart';
import '../Widgets/custom_textfiled.dart';
import 'intersts_screen.dart';
import 'login_screen.dart'; // Import the InterestsPage

class CreateAccountPage extends GetView<RegistrationController> {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Image.asset(
              "assets/Logo.png",
              width: 100,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 0.05,
                    letterSpacing: 0.28,
                  ),
                ),
                const SizedBox(
                  height: 38,
                ),
                const Text(
                  'Please fill in the details to create your account',
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                    letterSpacing: 0.16,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  labelText: 'Username',
                  hintText: 'Please enter username',
                  controller: controller.usernameController,
                  icon: Icons.person,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'Please enter email',
                  controller: controller.emailController,
                  icon: Icons.email,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 15,

                ),
                CustomTextField(
                  labelText: 'Password',
                  hintText: 'Please enter password',
                  controller: controller.passwordController,
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 180,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => LoginPage());
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        "Already have an account? Login now",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF3366FF),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Obx(() {
                  return CustomButton(
                    onPressed: controller.isButtonEnabled.value
                        ? () async {
                      try {
                        await controller.registerUser(
                          name: controller.usernameController.text,
                          email: controller.emailController.text,
                          password: controller.passwordController.text,
                        );

                        Get.to(() => const InterestsPage());
                      } catch (e) {
                        print('Registration failed: $e');
                      }
                    }
                        : null,
                    text: 'Create Account',
                    isButtonEnabled: controller.isButtonEnabled.value,
                  );
                }),

                const CustomDivider(text: 'or signup with'),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomOutlinedButton(
                      buttonText: 'Google',
                      imagePath: 'assets/google.png',
                      onPressed: () {
                        print('google button clicked');
                      },
                    ),
                    CustomOutlinedButton(
                      buttonText: 'Facebook',
                      imagePath: 'assets/Facebook.png',
                      onPressed: () {
                        print('Facebook button clicked');
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
