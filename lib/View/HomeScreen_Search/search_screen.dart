import 'package:amit_final_project/View/HomeScreen_Search/recents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../Controller/job_search_controller.dart';
import '../../Model/jobs_model.dart';
import 'filter_search.dart';

class JobSearchScreen extends StatefulWidget {
  final List<JobModel> jobsData;

  const JobSearchScreen({Key? key, required this.jobsData}) : super(key: key);

  @override
  State<JobSearchScreen> createState() => _JobSearchScreenState();
}

class _JobSearchScreenState extends State<JobSearchScreen> {
  final JobSearchController controller = Get.find<JobSearchController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      controller.jobsList.assignAll(widget.jobsData);
      controller.filterJobs('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Get.back(),
                  ),
                  Expanded(
                    child: Hero(
                      tag: 'searchField',
                      child: Material(
                        type: MaterialType.transparency,
                        child: TextFormField(
                          autofocus: true,
                          decoration: const InputDecoration(
                            labelText: 'Search jobs',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                            ),
                            prefixIcon: Icon(Iconsax.search_normal),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                            ),
                          ),
                          onChanged: (value) => controller.filterJobs(value),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (!controller.showPlaceholder.isTrue) {
                  return const FilterScreen();
                } else {
                  return const FilteredJobsListView();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
