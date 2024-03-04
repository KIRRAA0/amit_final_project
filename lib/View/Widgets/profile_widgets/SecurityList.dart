import 'package:amit_final_project/View/Profile/two_step_verfication.dart';
import 'package:amit_final_project/View/Widgets/inter_text_style.dart';
import 'package:amit_final_project/View/Widgets/profile_widgets/security_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Profile/Phone_number_edit.dart';
import '../../Profile/change_password.dart';
import '../../Profile/email_address_edit.dart';

class SecurityList extends StatelessWidget {
  const SecurityList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SecurityTile(
          leadingText: 'Email Address',
          trailingText: GetStorage().read('user_email') ?? '',
          onPressed: () {
            Get.to(() => const EmailEdit(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 500));
          },
        ),
        SecurityTile(
          leadingText: 'Phone Number',
          trailingText: GetStorage().read('user_phone') ?? 'not set',
          onPressed: () {
            Get.to(() => const PhoneEdit(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 500));
          },
        ),
        SecurityTile(
          leadingText: 'Change Password',
          trailingText: '**********',
          onPressed: () {
            Get.to(() => const ChangePassword(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 500));
          },
        ),
        SecurityTile(
          leadingText: 'Two Step verification',
          trailingText: 'Not Active',
          onPressed: () {
            Get.to(() => const TwoStepVerification(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 500));
          },
        ),
        SecurityTile(
          leadingText: 'Face ID',
          trailingText: 'Not Set',
          onPressed: () {},
        ),
      ],
    );
  }
}
