import 'package:amit_final_project/Controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Controller/create_account_controller.dart';
import 'Controller/job_search_controller.dart';
import 'View/Login_SignUp/prefefred_location.dart';
import 'View/On_Boarding/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => SharedPreferences.getInstance());
  await GetStorage.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<RegistrationController>(RegistrationController());
    Get.put<LoginController>(LoginController());
    Get.put(JobSearchController()); // Initialize JobSearchController immediately

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: Color(0xFF3366FF)),
        ),
      ),
      title: 'Jobsque',
      home: const SplashScreen(),
    );
  }
}

