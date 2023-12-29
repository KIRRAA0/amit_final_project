import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Login_SignUp/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IntroductionScreenExample(),
    );
  }
}

class IntroductionScreenExample extends StatefulWidget {
  const IntroductionScreenExample({Key? key}) : super(key: key);

  @override
  _IntroductionScreenExampleState createState() =>
      _IntroductionScreenExampleState();
}

class _IntroductionScreenExampleState extends State<IntroductionScreenExample> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    checkIntroSeenStatus();
  }

  Future<void> checkIntroSeenStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool introSeen = prefs.getBool('introSeen') ?? false;

    if (introSeen) {
      Get.off(LoginPage());
    }
  }

  Future<void> markIntroAsSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('introSeen', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildPage(
                  "Page 1",
                  "Explore over 25,924 available job roles and upgrade your operator now.",
                  "Find a job, and ",
                  "start Building ",
                  "your career from now on",
                  "assets/intro1.png",
                ),
                _buildPage(
                  "Page 1",
                  "Immediately join us and start applying for the job you are interested in.",
                  "Hundreds of jobs are ",
                  "waiting for you ",
                  "to join together",
                  "assets/intro2.png",
                ),
                _buildPage(
                  "Page 1",
                  "Explore over 25,924 available job roles and upgrade your operator now.",
                  "Find a job, and",
                  "start Building",
                  "your career from now on",
                  "assets/intro3.png",
                ),
              ],
            ),
          ),
          _buildCustomIndicator(),
          _buildCustomButton(context),
        ],
      ),
    );
  }

  Widget _buildPage(String title, String body, String title2, String title3,
      String title4, String imageUrl) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/Logo.png",
                  width: 100,
                ),
                TextButton(
                  onPressed: () {
                    markIntroAsSeen();
                    Get.off(LoginPage());
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Image.asset(imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: title2,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 40.0),
                    ),
                    TextSpan(
                      text: title3,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                    ),
                    TextSpan(
                      text: title4,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 40.0),
                    ),
                  ],
                ),
              ),
            ),
            Text(body, style: const TextStyle(fontSize: 24.0)),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          margin: const EdgeInsets.all(8),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomButton(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.indigoAccent],
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () {
          if (_currentPage == 2) {
            markIntroAsSeen();
            Get.off(LoginPage());
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Text(
          _currentPage == 2 ? "Start App" : "Next",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
