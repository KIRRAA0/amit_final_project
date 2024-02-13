import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../Widgets/Custom_dropdown.dart';
import '../Widgets/filtered_jobs.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Iconsax.filter_search4)),
              CustomDropdown(
                categories: const ['Remote', 'On-Site', 'Hybrid'],
              ),
              CustomDropdown(
                categories: const ['Full-time', 'Part-time', 'Contract'],
              ),
              CustomDropdown(
                categories: const ['Post date', 'Post date 2', 'Post date 3'],
              ),
            ],
          ),
        ),
        Expanded(child: FilteredJobsListView()),
      ],
    );
  }
}
