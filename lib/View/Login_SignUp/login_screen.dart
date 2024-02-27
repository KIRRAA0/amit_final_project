import 'package:amit_final_project/Controller/login_controller.dart';
import 'package:amit_final_project/View/Forget_password/reset_password.dart';
import 'package:amit_final_project/View/HomeScreen_Search/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/checkbox.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_divider.dart';
import '../Widgets/custom_outlined_button.dart';
import '../Widgets/custom_textfiled.dart';
import 'create_account.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

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
                SizedBox(
                  height: screenHeight * 0.04,
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
                SizedBox(
                  height: screenHeight * 0.06,
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
                SizedBox(
                  height: screenHeight * 0.12,
                ),
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'Please enter Your Email',
                  controller: controller.emailController,
                  icon: Icons.person_outline,
                  obscureText: false,
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                CustomTextField(
                  labelText: 'Password',
                  hintText: 'Please enter password',
                  controller: controller.passwordController,
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                SizedBox(
                  height: screenHeight * 0.016,
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
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => const CreateAccountPage(),
                            transition: Transition.rightToLeftWithFade,
                            duration: const Duration(milliseconds: 500));
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
                SizedBox(
                  height: screenHeight * 0.008,
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
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setBool('isLoggedIn', true);
                              Get.off(() => const HomeScreen());
                            } catch (e) {
                              print('Login failed: $e');
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setBool('isLoggedIn', false);
                            }
                          }
                        : null,
                    text: 'Login',
                    isButtonEnabled: controller.isButtonEnabled.value,
                  );
                }),
                const CustomDivider(text: 'or login with'),
                SizedBox(
                  height: screenHeight * 0.008,
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
