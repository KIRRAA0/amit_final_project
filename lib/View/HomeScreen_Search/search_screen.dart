import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/job_search_controller.dart';
import '../../Model/jobs_model.dart';

class JobSearchScreen extends StatelessWidget {
  final JobSearchController controller = Get.put(JobSearchController()); // Initialize your controller

  JobSearchScreen({Key? key, required List<JobModel> jobsData}) : super(key: key) {
    controller.jobsList.assignAll(jobsData); // Assign jobs data to controller
    controller.filterJobs(''); // Initialize filtered jobs
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
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(35)),
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
              child: Obx(() => ListView.builder(
                itemCount: controller.filteredJobs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.filteredJobs[index].name),
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
