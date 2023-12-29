import 'package:amit_final_project/Controller/login_controller.dart';
import 'package:amit_final_project/View/Forget_password/reset_password.dart';
import 'package:amit_final_project/View/HomeScreen_Search/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/login_controller.dart';
import '../Widgets/checkbox.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_divider.dart';
import '../Widgets/custom_outlined_button.dart';
import '../Widgets/custom_textfiled.dart';
import 'create_account.dart';
import 'intersts_screen.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/Logo.png",
                      width: 100,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  "Login",
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
                  'Please login to find your dream job',
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
                  height: 120,
                ),
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'Please enter Your Email',
                  controller: controller.emailController,
                  icon: Icons.person,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  labelText: 'Password',
                  hintText: 'Please enter password',
                  controller: controller.passwordController,
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CheckboxExample(),
                    TextButton(
                      onPressed: () {
                        Get.to(() => ResetPassword());
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF3366FF),
                      ),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => CreateAccountPage());
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        "Don't have an account? Register now",
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
                              await controller.loginUser(
                                email: controller.emailController.text,
                                password: controller.passwordController.text,
                              );
                              Get.to(() => HomeScreen());
                            } catch (e) {
                              print('Login failed: $e');
                            }
                          }
                        : null,
                    text: 'Login',
                    isButtonEnabled: controller.isButtonEnabled.value,
                  );
                }),
                const CustomDivider(text: 'or login with'),
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
