import 'package:amit_final_project/View/Forget_password/password_changed.dart';
import 'package:amit_final_project/View/Login_SignUp/login_screen.dart';
import 'package:amit_final_project/View/Widgets/custom_button.dart';
import 'package:amit_final_project/View/Widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../API/update_password_API.dart';
import '../Widgets/custom_appbar.dart';

class CreateNewPassword extends StatelessWidget {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
  TextEditingController();

  CreateNewPassword({Key? key}) : super(key: key);

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
              'Create New Password',
              style: TextStyle(
                color: Color(0xFF111827),
                fontSize: 30,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Set your new password so you can login and access Jobsque',
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
              labelText: 'Enter New password...',
              hintText: "Password",
              controller: newPasswordController,
              obscureText: true,
              icon: Icons.lock_outline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            CustomTextField(
              labelText: 'Confirm New password...',
              hintText: "Confirm Password",
              controller: confirmNewPasswordController,
              obscureText: true,
              icon: Icons.lock_outline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Confirm Password is required';
                } else if (value != newPasswordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
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
                    "You remember your password? Login now",
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
                if (_arePasswordsValid()) {
                  final newPassword = newPasswordController.text;
                  updatePassword(newPassword);
                  Get.to(() => PasswordChanged());
                } else {
                  debugPrint('Invalid passwords');
                }
              },
              text: "Request Password Reset",
              isButtonEnabled: true,
            ),
          ],
        ),
      ),
    );
  }

  bool _arePasswordsValid() {
    return newPasswordController.text.isNotEmpty &&
        confirmNewPasswordController.text.isNotEmpty &&
        newPasswordController.text == confirmNewPasswordController.text &&
        newPasswordController.text.length >= 8;
  }
}
