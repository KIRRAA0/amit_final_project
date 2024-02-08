import 'package:amit_final_project/View/HomeScreen_Search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../API/Api_helper.dart';
import '../../Controller/create_account_controller.dart';
import '../../Model/jobs_model.dart';
import '../../Utilities/getUsernameFromSharedPreferences.dart';
import '../Widgets/job_list_item.dart';
import '../Widgets/jobs_slider.dart';
import '../Widgets/userinfo row.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

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
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Hero(
                  tag: 'searchField',
                  child: Material(
                    type: MaterialType.transparency,
                    child: TextFormField(
                      onTap: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        final jobsData = await _jobsFuture;
                        Get.to(() => JobSearchScreen(jobsData: jobsData),
                            transition: Transition.fade);
                      },
                      controller: searchController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Search jobs',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder<List<JobModel>>(
                future: _jobsFuture,
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
              const SizedBox(
                height: 20,
              ),
              FutureBuilder<List<JobModel>>(
                future: _jobsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No jobs available');
                  } else {
                    return Expanded(
                      child: ListView.separated(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return JobListItem(job: snapshot.data![index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
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
