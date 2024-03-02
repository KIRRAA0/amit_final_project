import 'package:amit_final_project/View/Widgets/custom_button.dart';
import 'package:amit_final_project/View/Widgets/custom_textfiled.dart';
import 'package:amit_final_project/View/Widgets/inter_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../../API/update_password_API.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        onPressed: () {
          final newPassword = newPasswordController.text;
          updatePassword(newPassword);
        },
        text: 'Save',
        isButtonEnabled: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InterTextStyle.getTextWidget(
              text: ' Enter your new password',
              size: 15,
              opacity: 0.7,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              icon: Iconsax.lock,
              labelText: "Password",
              hintText: 'Password',
              controller: newPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: 30,),
            InterTextStyle.getTextWidget(
              text: ' Confirm your new password',
              size: 15,
              opacity: 0.7,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              icon: Iconsax.lock,
              labelText: "Confirm Password",
              hintText: 'Password',
              controller: confirmPasswordController,
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
