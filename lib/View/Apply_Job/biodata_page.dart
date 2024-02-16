import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/custom_textfiled.dart';

class BiodataPage extends StatefulWidget {
  BiodataPage({Key? key}) : super(key: key);

  @override
  _BiodataPageState createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('user_name');

    setState(() {
      nameController.text = userName ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
              style: TextStyle(fontSize: 12.5, color: Colors.black.withOpacity(0.5)),
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
              icon: Iconsax.user,
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
              icon: Icons.email_outlined,
              obscureText: false,
            ),
          ],
        ),
      ),
    );
  }
}
