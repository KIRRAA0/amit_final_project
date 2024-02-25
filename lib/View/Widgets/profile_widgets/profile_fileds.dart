import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../custom_textfiled.dart';

class EditProfileForm extends StatefulWidget {
  final double screenHeight;

  const EditProfileForm({Key? key, required this.screenHeight}) : super(key: key);

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserData();
  }
  
  Future<void> _getUserData() async {
    String userName = GetStorage().read('user_name') ?? '';
    String userEmail = GetStorage().read('user_email') ?? '';
    String userPhone = GetStorage().read('user_phone') ?? '';
    setState(() {
      nameController.text = userName;
      emailController.text = userEmail;
      phoneController.text = userPhone.substring(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Full Name",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: widget.screenHeight * 0.01),
            CustomTextField(
              labelText: 'Name',
              hintText: 'Please enter Your Full Name',
              controller: nameController,
              obscureText: false,
            ),
            SizedBox(height: widget.screenHeight * 0.03),
            const Text(
              "Email",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: widget.screenHeight * 0.01),
            CustomTextField(
              labelText: 'Email',
              hintText: 'Please enter Your Email',
              controller: emailController,
              obscureText: false,
            ),
            SizedBox(height: widget.screenHeight * 0.03),
            const Text(
              "Phone Number",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: widget.screenHeight * 0.01),
            IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(),
                ),
              ),
              initialCountryCode: 'EG',
              controller: phoneController,
              onChanged: (phone) {
                setState(() {
                  phoneController.text = phone.completeNumber;
                });
                GetStorage().write('user_phone', phone.completeNumber);
              },
            )
          ],
        ),
      ),
    );
  }
}
