import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../Controller/job_search_controller.dart';

class FilteredJobsListView extends StatelessWidget {
  const FilteredJobsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<JobSearchController>();
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.grey.withOpacity(0.2),
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Recent searches',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: controller.filteredJobs.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Iconsax.clock),
              trailing: const Icon(
                Icons.highlight_remove,
                color: Colors.red,
              ),
              title: Text(controller.filteredJobs[index].name),
            );
          },
        ),
        // Add more widgets if needed
      ],
    );
  }
}