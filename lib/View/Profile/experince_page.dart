import 'package:flutter/material.dart';

import '../Widgets/profile_widgets/experince_form.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ExperienceForm(
              screenHeight: MediaQuery.of(context).size.height,
            ),
          ],
        ),
      ),
    );
  }
}
