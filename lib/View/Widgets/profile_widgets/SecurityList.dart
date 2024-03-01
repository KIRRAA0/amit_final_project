import 'package:amit_final_project/View/Widgets/inter_text_style.dart';
import 'package:amit_final_project/View/Widgets/profile_widgets/security_tile.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

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
          },
        ),
        SecurityTile(
          leadingText: 'Phone Number',
          trailingText: GetStorage().read('user_phone') ?? 'not set',
          onPressed: () {
          },
        ),
        SecurityTile(
          leadingText: 'Change Password',
          trailingText: '**********',
          onPressed: () {
          },
        ),
        SecurityTile(
          leadingText: 'Two Step verification',
          trailingText: 'Not Active',
          onPressed: () {
          },
        ),
        SecurityTile(
          leadingText: 'Face ID',
          trailingText: 'Not Set',
          onPressed: () {
          },
        ),
      ],
    );
  }
}
