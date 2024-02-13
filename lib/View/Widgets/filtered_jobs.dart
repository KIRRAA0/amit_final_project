import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/job_search_controller.dart';
import '../HomeScreen_Search/not_found.dart';
import '../Widgets/job_list_item.dart'; // Ensure this import is correct

class FilteredJobsListView extends StatelessWidget {
  FilteredJobsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JobSearchController controller = Get.find<JobSearchController>();

    return Obx(() {
      if (controller.filteredJobs.isEmpty) {
        return const NotFound();
      } else {
        return ListView.builder(
          itemCount: controller.filteredJobs.length,
          itemBuilder: (context, index) {
            final job = controller.filteredJobs[index];
            return JobListItem(job: job);
          },
        );
      }
    });
  }
}
