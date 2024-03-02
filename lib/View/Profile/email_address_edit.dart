import 'package:amit_final_project/View/Widgets/custom_button.dart';
import 'package:amit_final_project/View/Widgets/custom_textfiled.dart';
import 'package:amit_final_project/View/Widgets/inter_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class EmailEdit extends StatelessWidget {
  const EmailEdit({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    final email = GetStorage().read('user_email');
    controller.text = email ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Address'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        onPressed: () {
          final enteredEmail = controller.text;
          GetStorage().write('user_email', enteredEmail);
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
              text: 'Main Email Address',
              size: 13,
              opacity: 0.6,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              icon: Icons.email_outlined,
              labelText: "Email Address",
              hintText: 'Email',
              controller: controller,
            )
          ],
        ),
      ),
    );
  }
}
