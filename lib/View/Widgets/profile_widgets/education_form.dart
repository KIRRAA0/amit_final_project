import 'package:amit_final_project/View/Widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'education_fileds.dart';

class EducationForm extends StatelessWidget {
  final double screenHeight;

  EducationForm({Key? key, required this.screenHeight}) : super(key: key);

  final TextEditingController universityController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController startYearController = TextEditingController();
  final TextEditingController endYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.5), width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "University Name",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: screenHeight * 0.01),
                EducationTextFormField(
                  labelText: 'University',
                  hintText: 'Please enter Your University Name',
                  controller: universityController,
                ),
                SizedBox(height: screenHeight * 0.03),
                const Text(
                  "Title",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: screenHeight * 0.01),
                EducationTextFormField(
                  labelText: 'Title',
                  hintText: 'Please enter Your Title',
                  controller: titleController,
                ),
                SizedBox(height: screenHeight * 0.03),
                const Text(
                  "Start Year",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: screenHeight * 0.01),
                EducationTextFormField(
                  labelText: 'Start Year',
                  hintText: 'Please enter Your Start Year',
                  controller: startYearController,
                  isDateField: true,
                ),
                SizedBox(height: screenHeight * 0.03),
                const Text(
                  "End Year",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: screenHeight * 0.01),
                EducationTextFormField(
                  labelText: 'End Year',
                  hintText: 'Please enter Your End Year',
                  controller: endYearController,
                  isDateField: true,
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomButton(
                    onPressed: () {}, text: 'save', isButtonEnabled: true)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
