import 'package:flutter/material.dart';

import '../../../API/add_experience_API.dart';
import '../custom_button.dart';
import 'education_fileds.dart';

class ExperienceForm extends StatefulWidget {
  final double screenHeight;

  const ExperienceForm({super.key, required this.screenHeight});

  @override
  State<ExperienceForm> createState() => _ExperienceFormState();
}

class _ExperienceFormState extends State<ExperienceForm> {
  final TextEditingController positionController = TextEditingController();

  final TextEditingController typeOfWorkController = TextEditingController();

  final TextEditingController companyNameController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final TextEditingController startDateController = TextEditingController();

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
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Position",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: widget.screenHeight * 0.01),
                EducationTextFormField(
                  labelText: 'Position',
                  hintText: 'Please enter Your Position',
                  controller: positionController,
                ),
                SizedBox(height: widget.screenHeight * 0.03),
                const Text(
                  "Type of work",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: widget.screenHeight * 0.01),
                EducationTextFormField(
                  labelText: 'Work',
                  hintText: 'Please enter Your Type of work',
                  controller: typeOfWorkController,
                ),
                SizedBox(height: widget.screenHeight * 0.03),
                const Text(
                  "Company Name",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: widget.screenHeight * 0.01),
                EducationTextFormField(
                  labelText: 'Name',
                  hintText: 'Please enter Your Company name',
                  controller: companyNameController,
                ),
                SizedBox(height: widget.screenHeight * 0.03),
                const Text(
                  "Start Year",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: widget.screenHeight * 0.01),
                EducationTextFormField(
                  labelText: 'Start Year',
                  hintText: 'Please enter Your Start Year',
                  controller: startDateController,
                  isDateField: true,
                ),
                SizedBox(height: widget.screenHeight * 0.03),
                const Text(
                  "Location",
                  style: TextStyle(fontSize: 18),
                ),
                EducationTextFormField(
                  labelText: 'Location',
                  hintText: 'Please enter Your Location',
                  controller: locationController,
                ),
                SizedBox(height: widget.screenHeight * 0.03),
                CustomButton(
                  onPressed: () {
                    addExperience(
                      positionController.text,
                      typeOfWorkController.text,
                      companyNameController.text,
                      locationController.text,
                      startDateController.text,
                    );
                  },
                  text: 'Save',
                  isButtonEnabled: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
