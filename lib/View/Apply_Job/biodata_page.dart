import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/custom_textfiled.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key,});

  @override
  _BiodataPageState createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('user_name');
    String? userEmail = prefs.getString('user_email');
    String? userPhone = GetStorage().read('user_phone');
    GetStorage().write('user_name', userName);
    GetStorage().write('user_email', userEmail);
    nameController.text = userName ?? '';
    emailController.text = userEmail ?? '';
    phoneController.text = userPhone?.substring(3) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Biodata",
              style: TextStyle(fontSize: 23),
            ),
            Text(
              "Fill Your Bio data correctly",
              style: TextStyle(
                  fontSize: 14.5, color: Colors.black.withOpacity(0.5)),
            ),
            SizedBox(height: screenHeight * 0.045),
            const Text(
              "Full Name",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: screenHeight * 0.01),
            CustomTextField(
              labelText: 'Name',
              hintText: 'Please enter Your Full Name',
              controller: nameController,
              obscureText: false,
            ),
            SizedBox(height: screenHeight * 0.03),
            const Text(
              "Email",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: screenHeight * 0.01),
            CustomTextField(
              labelText: 'Email',
              hintText: 'Please enter Your Email',
              controller: emailController,
              obscureText: false,
            ),
            SizedBox(height: screenHeight * 0.03),
            const Text(
              "Phone Number",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: screenHeight * 0.01),
            GetBuilder<_BiodataPageController>(
              init: _BiodataPageController(),
              builder: (_BiodataPageController controller) {
                return IntlPhoneField(
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
                    controller.updateUserPhone(phone.completeNumber);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _BiodataPageController extends GetxController {
  var userPhone = ''.obs;

  void updateUserPhone(String phone) {
    userPhone.value = phone;
    GetStorage().write('user_phone', phone);
  }
}
