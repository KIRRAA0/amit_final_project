import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../API/Api_helper.dart';
import '../../Controller/create_account_controller.dart';
import '../../Model/jobs_model.dart';
import '../Widgets/jobs_slider.dart';
import '../Widgets/userinfo row.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key) {}


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RegistrationController controller = Get.find<RegistrationController>();

  final ApiData jobService = ApiData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              UserInfoWithNotification(
                usernameFuture: getUsernameFromSharedPreferences(),
              ),
              FutureBuilder<List<JobModel>>(
                future: _fetchJobs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No jobs available');
                  } else {
                    return buildCarouselSlider(snapshot.data!);
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  printSavedToken();
                },
                child: const Text('Print Saved Token'),
              ),
              ElevatedButton(
                onPressed: () {
                  printSavedName();
                },
                child: const Text('Print Saved name'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> getUsernameFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? retrievedUsername = prefs.getString('user_name');
    print('Retrieved username: $retrievedUsername');
    return retrievedUsername;
  }
  Future<List<JobModel>> _fetchJobs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedToken = prefs.getString('user_token');
    return jobService.fetchJobs(savedToken!);
  }
  Future<void> printSavedToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? savedToken = prefs.getString('user_token');

    if (savedToken != null) {
      print('Saved Token: $savedToken');
    } else {
      print('No token saved.');
    }
  }
  Future<void> printSavedName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? savedName = prefs.getString('user_name');

    if (savedName != null) {
      print('Saved name: $savedName');
    } else {
      print('No name saved.');
    }
  }
}
