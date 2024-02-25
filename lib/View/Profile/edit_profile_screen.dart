import 'package:flutter/material.dart';

import '../Widgets/profile_widgets/profile_fileds.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Change Photo',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  )),
              EditProfileForm(
                screenHeight: MediaQuery.of(context).size.height,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
