import 'package:amit_final_project/View/Widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../Widgets/profile_widgets/two_step_switcher.dart';

class TwoStepVerification extends StatefulWidget {
  const TwoStepVerification({super.key});

  @override
  State<TwoStepVerification> createState() => _TwoStepVerificationState();
}

class _TwoStepVerificationState extends State<TwoStepVerification> {
  String? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    List<String> verificationMethods = [
      'Telephone number (SMS)',
      'Email',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Two-step verification'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        onPressed: () {
        },
        text: 'Next',
        isButtonEnabled: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSwitchWidget(),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedMethod,
                  hint: const Text('Select a verification method'),
                  items: verificationMethods.map((String method) {
                    return DropdownMenuItem<String>(
                      value: method,
                      child: Text(method),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedMethod = newValue;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Note: Turning this feature will sign you out anywhere you’re currently signed in. '
                  'We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
