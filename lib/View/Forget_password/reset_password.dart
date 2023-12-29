import 'package:amit_final_project/View/Forget_password/check_email.dart';
import 'package:amit_final_project/View/Login_SignUp/login_screen.dart';
import 'package:amit_final_project/View/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:amit_final_project/View/Widgets/custom_textfiled.dart';
import 'package:get/get.dart';

import '../Widgets/custom_appbar.dart';

class ResetPassword extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reset Password',
              style: TextStyle(
                color: Color(0xFF111827),
                fontSize: 30,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 17,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.16,
              ),
            ),
            const SizedBox(height: 55),
            CustomTextField(
              labelText: 'Enter Your email...',
              hintText: "Email",
              controller: emailController,
              obscureText: false,
              icon: Icons.mail_outline,
            ),
            const Spacer(),
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
                    "You Remember your password? Login now",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF3366FF),
                    ),
                  ),
                ),
              ],
            ),
            CustomButton(
                onPressed: () {
                  Get.to(() => CheckMail());
                },
                text: "Request Password reset",
                isButtonEnabled: true)
          ],
        ),
      ),
    );
  }
}
