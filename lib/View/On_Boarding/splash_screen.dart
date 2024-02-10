import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomeScreen_Search/HomeView.dart';
import '../Login_SignUp/login_screen.dart';
import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 4), () {
      _checkIntroStatus();
    });
  }

  void _checkIntroStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasViewedIntro = prefs.getBool('introSeen') ?? false;
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Get.off(() => HomeContent());
    } else if (hasViewedIntro) {
      Get.off(() => LoginPage());
    } else {
      Get.off(() => const IntroductionScreenExample());
    }
  }


  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/Blur.png',
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
            Image.asset('assets/Logo.png'),
          ],
        ),
      ),
    );
  }
}
