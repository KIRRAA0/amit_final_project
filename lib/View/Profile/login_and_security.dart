import 'package:amit_final_project/View/Widgets/inter_text_style.dart';
import 'package:amit_final_project/View/Widgets/profile_widgets/security_tile.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../Widgets/profile_widgets/SecurityList.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login and security'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.grey.withOpacity(0.15),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: InterTextStyle.getTextWidget(
                  text: 'Account access',
                  size: 16,
                  opacity: 0.5,
                ),
              ),
            ),
            const SecurityList(),
          ],
        ),
      ),
    );
  }
}
