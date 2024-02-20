import 'package:amit_final_project/View/HomeScreen_Search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../API/Api_helper.dart';
import '../../Controller/create_account_controller.dart';
import '../../Model/jobs_model.dart';
import '../../Utilities/getUsernameFromSharedPreferences.dart';
import '../Widgets/job_list_item.dart';
import '../Widgets/jobs_slider.dart';
import '../Widgets/userinfo row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RegistrationController controller = Get.find<RegistrationController>();
  final ApiData jobService = ApiData();
  TextEditingController searchController = TextEditingController();
  late Future<List<JobModel>> _jobsFuture = _fetchJobs();

  @override
  void initState() {
    super.initState();
    _initializeJobsFuture();
  }

  Future<void> _initializeJobsFuture() async {
    _jobsFuture = _fetchJobs();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserInfoWithNotification(
                usernameFuture: getUsernameFromSharedPreferences(),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Hero(
                          tag: 'searchField',
                          child: Material(
                            type: MaterialType.transparency,
                            child: TextFormField(
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) async {
                                  final jobsData = await _jobsFuture;
                                  Get.to(
                                      () => JobSearchScreen(jobsData: jobsData),
                                      transition: Transition.fade);
                                });
                              },
                              readOnly: true,
                              controller: searchController,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35)),
                                ),
                                labelText: 'Search jobs',
                                prefixIcon: Icon(Iconsax.search_normal),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Suggested Job",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'SF Pro Display',
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "View All",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      FutureBuilder<List<JobModel>>(
                        future: _jobsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            print(snapshot.error);
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Text('No jobs available');
                          } else {
                            return buildCarouselSlider(snapshot.data!);
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Recent Job",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'SF Pro Display',
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "View All",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      FutureBuilder<List<JobModel>>(
                        future: _jobsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            print(snapshot.error);
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Text('No jobs available');
                          } else {
                            return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return JobListItem(job: snapshot.data![index]);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider();
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
}
